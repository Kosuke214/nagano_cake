class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_item
  has_many :order
  has_many :address

  def active_for_authentication?
    super && (is_deleted == false)
  end

  def own_address
  '〒' + postal_code + ' ' + customer_address
  end

  def own_full_name
  last_name + first_name
  end

end
