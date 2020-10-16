class FavoritesController < ApplicationController
  before_action :wine_find, only: [:create, :destroy]

  def create
    @favorite = Favorite.new(user_id: current_user.id, wine_id: @wine.id)
    @favorite.save
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, wine_id: @wine.id)
    @favorite.destroy
  end

  private

  def wine_find
    @wine = Wine.find(params[:wine_id])
  end

end
