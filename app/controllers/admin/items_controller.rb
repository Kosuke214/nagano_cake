class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page])
    #@pages = @items.page(params[:page])
    #@genre = {1 => "ケーキ", 2 => "プリン", 3 => "焼き菓子", 4 => "キャンディ"}
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
    @genre = Genre.all
    #@genre = {1 => "ケーキ", 2 => "プリン", 3 => "焼き菓子", 4 => "キャンディ"}
    #redirect_to :edit
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
  end

  private

  def item_params
   params.require(:item).permit(:image, :genre_id, :name, :introduction, :price, :is_active)
  end

end
