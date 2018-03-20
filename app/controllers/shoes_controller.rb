class ShoesController < ApplicationController
  def index
    @shoe_all = if params[:term]
                      Shoe.where('name LIKE ?',
                                     "%#{params[:term]}%").page params[:page]
                    else
                      Shoe.page params[:page]
                    end
  end

  def show
    @shoe = Shoe.find(params[:id])
  end
end
