class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)
    @address = Address.where(customer_id: current_customer.id)
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @order.shipping_charge = "800"

    @total = 0
    @cart_items.each do |cart_item|
      @total += cart_item.subtotal
    end

    @order.amount = @total + @order.shipping_charge

    @order.customer_id = current_customer.id


    if params[:order][:address_option] == "0"
      @order.shipping_postalcode = current_customer.postal_code
      @order.shipping_address = current_customer.customer_address
      @order.shipping_name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_option] == "1"
      @order.shipping_address = Address.find(params[:order][:address_id]).postal_code + Address.find(params[:order][:address_id]).address
      @order.shipping_name = Address.find(params[:order][:address_id]).name
    #else
      #@order.new_shipping_address = Order.shipping_postalcode + Order.shipping_address
      #@order.new_shipping_name = Order.shipping_name
    end


  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    cart_item = CartItem.where(customer_id: current_customer.id)

    @order.save

    cart_item.each do |cart_item|
      OrderDetail.create(
        item_id: cart_item.item.id,
        order_id: @order.id,
        amount: cart_item.amount,
        price_including_tax: cart_item.item.with_tax_price
        )
    end
    cart_item.destroy_all
    redirect_to orders_complete_path
  end

  def index
    @order = Order.all
    #@order_items = OrderDetail.find(params[:item_id])
  end

  def show
    @order = Order.find(params[:id])

    @total = 0
    @order.order_detail.each do |order_details|
      @total += order_details.subtotal
    end

  end


  private

  def order_params
   params.require(:order).permit(:customer_id, :payment_method, :amount,:shipping_charge, :shipping_name, :shipping_postalcode, :shipping_address, :order_status)
  end

end
