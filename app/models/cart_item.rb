class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  scope :unpaid, -> { where(paid: false) }

  after_save :recalculate_cart_discount
  after_destroy :recalculate_cart_discount

  def display_price
    total_price.to_i
  end

  def total_price
    product.price * quantity
  end

  def recalculate_cart_discount
   cart.recalculate_cart_discount
  end
end
