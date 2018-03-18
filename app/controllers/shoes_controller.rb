class ShoesController < ApplicationController
  def index
    @shoe_all = Shoe.all
  end

  def show
    @shoe = Shoe.find(params[:id])
  end
end
