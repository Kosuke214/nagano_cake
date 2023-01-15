class Public::ItemsController < ApplicationController
  def index
    @items = Item.order(created_at: :desc).page(params[:page]).per(8)
    @genre = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @genre = Genre.all
    @cart_item = CartItem.new
  end

end
