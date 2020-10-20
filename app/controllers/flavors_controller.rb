class FlavorsController < ApplicationController
  before_action :wine_find, only: [:edit, :update]
  before_action :flavor_find, only: [:edit, :update]

  def update
    if @flavor.update(flavor_params)
      redirect_to wine_path(@wine)
    else
      render :edit
    end
  end

  private

  def wine_find
    @wine = Wine.find(params[:id])
  end

  def flavor_find
    @flavor = @wine.flavor
  end

  def flavor_params
    params.require(:flavor).permit(:impression_id, :flavor_volume_id, :first_flavor_id, :second_flavor_id, :third_flavor_id, :comment).merge(wine_id: @wine.id)
  end

end
