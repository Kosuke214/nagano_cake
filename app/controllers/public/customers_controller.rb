class Public::CustomersController < ApplicationController
  def show
    #@customer = Customer.where(id: params[:id])
    @customer = current_customer
  end

  def edit
    @customer = current_customer
    #@customer = Customer.find(params[:id])
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to customers_my_page_path
  end

  def unsubscribe
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end


  private

  def customer_params
   params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :customer_address, :telephone_number)
  end
end
