class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
    @pages = Item.page(params[:page])
    #@page = Article.all.page(params[:page]
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
  end

  def show
    @item = Item.find(params[:id])
    #redirect_to :edit
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
  end

  private

  def item_params
   params.require(:item).permit(:image, :genre_id, :name, :introduction, :price, :is_active)
  end

end
