class TastesController < ApplicationController
  before_action :wine_find, only: [:edit, :update]
  before_action :taste_find, only: [:edit, :update]

  def update
    if @taste.update(taste_params)
      redirect_to wine_path(@wine)
    else
      render :edit
    end
  end

  private

  def wine_find
    @wine = Wine.find(params[:id])
  end

  def taste_find
    @taste = @wine.taste
  end

  def taste_params
    params.require(:taste).permit(:attack_id, :alcohol_level_id, :acidity_level_id, :tannic_level_id, :after_flavor_id, :description_id, :comment).merge(wine_id: @wine.id)
  end

end
