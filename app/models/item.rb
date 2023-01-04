class Item < ApplicationRecord
  has_one_attached :image

  has_many :cart_item
  has_many :order_detail
  #belongs_to :genre

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image_square.jpg')
      image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [100, 100]).processed
  end

end
