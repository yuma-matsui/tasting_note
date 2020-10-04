class WinesController < ApplicationController

  def index
  end

  def new
    @wine = Wine.new
  end

  def create
    @wine = Wine.new(wine_params)
    if @wine.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def wine_params
    params.require(:wine).permit(:name, :color_id, :variety_id, :country_id, :region, :vintage, :alcohol_volume_id, :marriage_food, :producer, :image).merge(user_id: current_user.id)
  end
  
end
