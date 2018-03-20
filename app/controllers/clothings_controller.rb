class ClothingsController < ApplicationController
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
    @clothing = Clothing.find(params[:id]).order('name')
  end

  def recent_update
    @recent_clothing = Clothing.where(updated_at: (Time.now - 12.hours)..Time.now)
  end
end
