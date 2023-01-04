class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
    @pages = Customer.page(params[:page])
    #@page = Article.all.page(params[:page]
  end

  def show
    @customer = Customer.find(params[:id])
    #redirect_to :edit
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
  end


  private

  def customer_params
   params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :customer_address, :telephone_number)
  end
end
