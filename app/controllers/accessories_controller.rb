class AccessoriesController < ApplicationController
  def index
    @accessory_all = Accessory.all

    @accessory_all = if params[:term]
                      Accessory.where('name LIKE ?',
                                     "%#{params[:term]}%").page params[:page]
                    else
                      Accessory.page params[:page]
                    end
  end

  def show
    @accessory = Accessory.find(params[:id])
  end
end
