class FavoritesController < ApplicationController
  before_action :wine_find, only: [:create]

  def create
    favorite = Favorite.create(user_id: current_user.id, wine_id: @wine.id)
    redirect_to wine_path(@wine)
  end

  private

  def wine_find
    @wine = Wine.find(params[:wine_id])
  end

end