class ClothingsController < ApplicationController
  def index
    @clothing_all = Clothing.all
  end

  def show
    @clothing = Clothing.find(params[:id])
  end
end
