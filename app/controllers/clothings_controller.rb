class ClothingsController < ApplicationController
  def index

      @clothing_all = if params[:term]
                        Clothing.where('name LIKE ?',
                                  "%#{params[:term]}%").page params[:page]
                      else
                        Clothing.page params[:page]
                      end
  end

  def show
    @clothing = Clothing.find(params[:id])
  end
end
