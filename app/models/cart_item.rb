class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  scope :unpaid, -> { where(paid: false) }

  def display_price
    format('%.2f', total_price)
  end

  def total_price
    product.price * quantity
  end
end
