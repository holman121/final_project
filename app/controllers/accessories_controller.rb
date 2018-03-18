class AccessoriesController < ApplicationController
  def index
    @accessory_all = Accessory.all
  end

  def show
    @accessory = Accessory.find(params[:id])
  end
end
