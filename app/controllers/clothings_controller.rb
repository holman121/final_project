class ClothingsController < ApplicationController

  before_action :init_shopping_cart
  before_action :load_shopping_cart_items
  before_action :init_quantity


  def index

    @clothing_all = if (params[:term] || params[:categoryDrops]) && params[:filter] == "Recent"
                      Clothing.where('name LIKE ? AND category_id LIKE ?',
                                     "%#{params[:term]}%", "%#{params[:categoryDrops]}%")
                          .where(updated_at: (Time.now - 6.hours)..Time.now)
                          .page params[:page]

                    elsif (params[:term] || params[:categoryDrops]) && params[:filter] == "Sale"
                      Clothing.where('name LIKE ? AND category_id LIKE ?',
                                     "%#{params[:term]}%", "%#{params[:categoryDrops]}%")
                          .where('sale_id == 1')
                          .page params[:page]

                    elsif params[:filter] == 'Recent'
                      Clothing.where(updated_at: (Time.now - 6.hours)..Time.now).page params[:page]

                    elsif params[:filter] == 'Sale'
                      Clothing.where('sale_id == 1')

                    elsif params[:term] || params[:categoryDrops]
                      Clothing.where('name LIKE ? AND category_id LIKE ?',
                                     "%#{params[:term]}%", "%#{params[:categoryDrops]}%").page params[:page]
                    else
                      Clothing.page params[:page]
                    end

    @category_all = Category.where('Id IN (1,2,3,4,6,8,9)')
  end

  def show
    @clothing = Clothing.find(params[:id])
  end

  def recent_update
    @recent_clothing = Clothing.where(updated_at: (Time.now - 12.hours)..Time.now)
  end

  def add_to_shopping_cart
    id = params[:id].to_i
    # price = params[:price].to_s

    session[:shopping_cart] << id

    # session[:shopping_cart].each do |id|
    #   @price = Clothing.where('Id == ?', id)
    #   # @total += @price.to_s
    # end


    redirect_to clothings_path
  end


  def clear_shopping_cart
    session[:shopping_cart] = nil
    redirect_to clothings_path
  end

  def delete_from_shopping_cart
    id = params[:id].to_i
    session[:shopping_cart].delete(id)

    redirect_to clothings_path
  end

  def delete_one_item_from_shopping_cart
    id = params[:id].to_i
    session[:shopping_cart].delete_at(session[:shopping_cart].index(id) || session[:shopping_cart].length)
    redirect_to clothings_path
  end


  private
  def init_shopping_cart
      session[:shopping_cart] ||= []
      @total ||= 0
  end

  def load_shopping_cart_items
    @shopping_cart_items = Clothing.find(session[:shopping_cart])
  end

  def init_quantity
    session[:quantity] ||= []
  end

end
