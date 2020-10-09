class WinesController < ApplicationController
  before_action :session_set, only: [:create_look, :create_flavor, :create_taste]
  before_action :wines_set, only: [:home, :index]
  before_action :wine_find, only: [:show, :destroy]

  def new
    @wine = Wine.new
  end

  def create
    @wine = Wine.new(wine_params)
    if @wine.save
      session["wine.data"] = { wine: @wine.attributes }
      @look = @wine.build_look
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
      @flavor = @wine.build_flavor
      render :new_flavor
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
      @taste = @wine.build_taste
      render :new_taste
    else
      render :new_flavor
    end
  end

  def new_taste
    @taste = Taste.new
  end

  def create_taste
    @taste = Taste.new(taste_params)
    if @taste.save
      session["wine.data"]["wine"].clear
      redirect_to root_path
    else
      render :new_taste
    end
  end

  def destroy
    if @wine.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def notes
    @wines = Wine.where(user_id: current_user.id).includes(:look, :flavor, :taste).order(created_at: :desc)
  end

  def color
    @wine = Wine.where(color_id: params[:color_id]).first
    @wines = Wine.where(color_id: params[:color_id]).includes(:look, :flavor, :taste).order(created_at: :desc)
  end

  def country
    @wine = Wine.where(country_id: params[:country_id]).first
    @wines = Wine.where(country_id: params[:country_id]).includes(:look, :flavor, :taste).order(created_at: :desc)
  end

  def grape
    @wine = Wine.where(variety_id: params[:variety_id]).first
    @wines = Wine.where(variety_id: params[:variety_id]).includes(:look, :flavor, :taste).order(created_at: :desc)
  end

  private

  def session_set
    @wine = Wine.new(session["wine.data"]["wine"])
  end

  def wine_params
    params.require(:wine).permit(:name, :color_id, :variety_id, :country_id, :region, :vintage, :alcohol_volume_id, :marriage_food, :producer, :image).merge(user_id: current_user.id)
  end

  def look_params
    params.require(:look).permit(:image, :color_tone_id, :intensity_id, :brightness_id, :viscosity_id, :comment).merge(wine_id: session["wine.data"]["wine"]["id"])
  end

  def flavor_params
    params.require(:flavor).permit(:impression_id, :flavor_volume_id, :first_flavor_id, :second_flavor_id, :third_flavor_id, :comment).merge(wine_id: session["wine.data"]["wine"]["id"])
  end

  def taste_params
    params.require(:taste).permit(:attack_id, :alcohol_level_id, :acidity_level_id, :tannic_level_id, :after_flavor_id, :description_id, :comment).merge(wine_id: session["wine.data"]["wine"]["id"])
  end

  def wines_set
    @wines = Wine.includes(:user, :look, :flavor, :taste).order(created_at: :desc)
  end

  def wine_find
    @wine = Wine.find(params[:id])
  end
  
end
