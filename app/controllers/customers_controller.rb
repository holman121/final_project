class CustomersController < ApplicationController
  def index
    @customer_all = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end
end
