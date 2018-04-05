class OrdersController < ApplicationController
  def index
    @order_all = Order.all
  end
end
