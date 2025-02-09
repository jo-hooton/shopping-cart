class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  scope :unpaid, -> { where(paid: false) }

  def display_price
    total_price.to_i
  end

  def total_price
    product.price * quantity
  end
end
