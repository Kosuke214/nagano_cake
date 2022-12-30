class Admin::HomesController < ApplicationController
  def top
    @orders=Order.all
    @pages = Order.page(params[:page])
  end
  
end
