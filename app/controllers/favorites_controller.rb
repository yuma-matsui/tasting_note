class FavoritesController < ApplicationController
  before_action :wine_find, only: [:create, :destroy]

  def index
    @favorites = Favorite.where(user_id: current_user.id).includes(:wine, :user).order(created_at: :desc)
  end

  def create
    favorite = current_user.favorites.build(wine_id: params[:wine_id])
    favorite.save
    redirect_to wine_path(@wine)
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, wine_id: params[:wine_id])
    favorite.destroy
    redirect_to wine_path(@wine)
  end


  private

  def wine_find
    @wine = Wine.find(params[:wine_id])
  end

end