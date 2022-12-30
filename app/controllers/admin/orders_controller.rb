class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @orders = @order.all
    @customer = @order.customer
    @item = @order.item
    @detail = @order.order_detail
  end 
  
  def update
  end
  
  private

  #def order_params
  # params.require(:order).permit(:title, :body)
  #end
end
