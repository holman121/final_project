class ClothingsController < ApplicationController
  def index
    @clothing_all = Clothing.all
  end

  def show
  end
end
