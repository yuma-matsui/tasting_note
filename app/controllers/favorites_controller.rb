class FavoritesController < ApplicationController
  before_action :wine_find, only: [:create, :destroy]

  def create
    favorite = Favorite.create(user_id: current_user.id, wine_id: @wine.id)
    redirect_to wine_path(@wine)
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, wine_id: @wine.id)
    favorite.destroy
    redirect_to wine_path(@wine)
  end


  private

  def wine_find
    @wine = Wine.find(params[:wine_id])
  end

end