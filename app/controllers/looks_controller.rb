class LooksController < ApplicationController
  before_action :wine_find, only: [:edit, :update]
  before_action :look_find, only: [:edit, :update]

  def update
    if @look.update(look_params)
      redirect_to wine_path(@wine)
    else
      render :edit
    end
  end

  private

  def wine_find
    @wine = Wine.find(params[:id])
  end

  def look_find
    @look = @wine.look
  end

  def look_params
    params.require(:look).permit(:image, :color_tone_id, :intensity_id, :brightness_id, :viscosity_id, :comment).merge(wine_id: @wine.id)
  end

end
