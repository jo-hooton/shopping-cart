class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items

  def total_formatted
    total.to_i
  end

  def total
    cart_items.unpaid.sum { |cp| cp.product.price * cp.quantity }
  end

  def total_items
    cart_items.unpaid.sum(:quantity)
  end

  def empty?
    cart_items.unpaid.empty?
  end
end
