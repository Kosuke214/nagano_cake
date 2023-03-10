class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all.page(params[:page]).per(10)
    #@pages = @customers.page(params[:page]).per(10)
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
    redirect_to admin_customers_path
  end


  private

  def customer_params
   params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :customer_address, :telephone_number, :is_deleted)
  end
end
