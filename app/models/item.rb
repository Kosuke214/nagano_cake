class Item < ApplicationRecord
  has_one_attached :image

  has_many :cart_item
  has_many :order_detail
  has_many :orders, through: :order_details
  belongs_to :genre

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image_square.jpg')
      image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [100, 100]).processed
  end

  def with_tax_price
    (price * 1.1).floor
  end

end
