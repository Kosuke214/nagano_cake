class Public::HomesController < ApplicationController

def top
  @items = Item.order(created_at: :desc).page(params[:page]).per(4)
  @genre = Genre.all
end

def about
end

end
