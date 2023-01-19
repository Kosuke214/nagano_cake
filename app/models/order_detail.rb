class OrderDetail < ApplicationRecord

  belongs_to :item
  belongs_to :order

  enum production_status: { production_cannot_be_done: 0, production_pending: 1, in_progress:2, finished:3  }



  def subtotal
    price_including_tax * amount
  end
end

