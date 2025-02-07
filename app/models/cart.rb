class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items

  def total_amount
    cart_items.sum { |cp| cp.product.price * cp.quantity }
  end

  def empty?
    cart_items.empty?
  end
end
