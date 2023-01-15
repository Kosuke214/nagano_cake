class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_item
    #@amount = @cart_items.cart_item_params[:amount]
    @total = 0
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to "/cart_items", notice: 'You have updated cart_item successfully.'
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    if @cart_item.destroy
      redirect_to cart_items_path, notice: 'You have deleted cart_item.'
    end

  end

  def destroy_all
    current_customer.cart_item.destroy_all
    redirect_to "/cart_items", notice: 'You have deleted cart_item_all.'
  end

  def create
    #binding.pry
    @cart_item = current_customer.cart_item.new(cart_item_params)
    if current_customer.cart_item.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = current_customer.cart_item.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.save
    else
      @cart_item.save
    end
    redirect_to "/cart_items"

  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:customer_id, :item_id, :amount)
  end
end
