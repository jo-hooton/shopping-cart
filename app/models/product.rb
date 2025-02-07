class Product < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :carts, through: :cart_items

  def display_price
    format('$%.2f', price)
  end
end
