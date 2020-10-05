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

  def new_flavor
    @flavor = Flavor.new
  end

  def create_flavor
    @flavor = Flavor.new(flavor_params)
    if @flavor.save
      redirect_to root_path
    else
      render :new_flavor
    end
  end

  private

  def wine_params
    params.require(:wine).permit(:name, :color_id, :variety_id, :country_id, :region, :vintage, :alcohol_volume_id, :marriage_food, :producer, :image).merge(user_id: current_user.id)
  end

  def look_params
    params.require(:look).permit(:image, :color_tone_id, :intensity_id, :brightness_id, :viscosity_id, :comment).merge(wine_id: params[:wine_id])
  end

  def flavor_params
    params.require(:flavor).permit(:impression_id, :flavor_volume_id, :first_flavor_id, :second_flavor_id, :third_flavor_id, :comment).merge(wine_id: params[:wine_id])
  end
  
end
