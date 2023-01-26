class Admin::OrderDetailsController < ApplicationController
  def update
    #@order = Order.find(params[:order_detail][:order_id])
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(detail_params)

    case @order_detail.production_status
      when "in_progress"
        @order_detail.order.update(order_status: "under_manufacture")

      when "finished"
        if @order_detail.order.order_detail.all?{|order_detail| order_detail.production_status == "finished"}
  				@order_detail.order.update(order_status: "preparing_to_ship")
  			end
  		end



    #if @order_detail.update(detail_params)
    #  @order_detail.order.update(order_status: "preparing_to_ship") if @order_detail.order.order_details.all?{|order_detail| order_detail.production_status == "finished"}
    #  redirect_to admin_order_path(@order_detail.order.id)
    #end

    redirect_to admin_order_path(@order_detail.order.id)

  end

  private

  def detail_params
   params.require(:order_detail).permit(:production_status)
  end
end
