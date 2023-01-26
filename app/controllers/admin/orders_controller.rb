class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    #@orders = @order.all
    #@customer = @order.customer
    #@item = @order.items
    #@detail = @order.order_detail

    @total = 0
    @order.order_detail.each do |order_details|
      @total += order_details.subtotal
    end
  end

  def update
    @order = Order.find(params[:id])
    #@order_details = @order.order_detail.all

    if @order.update(order_params)
      @order.order_detail.update_all(production_status: "production_pending") if @order.order_status == "payment_confirmation"
      redirect_to admin_order_path(@order.id)
    end





    



    #if @order.order_detail.update(detail_params)
    #  redirect_to admin_order_path(@order.id)
    #end

    #if @order.order_status == 1
     # @order_details.each do |order_detail|
      #  order_detail.production_status => 1
       # order_detail.update
      #end
    #end


  end

  private

  def order_params
   params.require(:order).permit(:order_id, :item_id, :order_status)
  end

  def detail_params
   params.require(:order_detail).permit(:production_status)
  end

end
