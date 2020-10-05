class WinesController < ApplicationController

  def index
  end

  def new
    @wine = Wine.new
  end

  def create
    @wine = Wine.new(wine_params)
    if @wine.save
      render :new_look
    else
      render :new
    end
  end

  def new_look
    @look = Look.new
  end

  def create_look
    @look = Look.new(look_params)
    if @look.save
      redirect_to root_path
    else
      render :new_look
    end
  end

  private

  def wine_params
    params.require(:wine).permit(:name, :color_id, :variety_id, :country_id, :region, :vintage, :alcohol_volume_id, :marriage_food, :producer, :image).merge(user_id: current_user.id)
  end

  def look_params
    params.require(:look).permit(:image, :color_tone_id, :intensity_id, :brightness_id, :viscosity_id, :comment).merge(wine_id: params[:wine_id])
  end
  
end
