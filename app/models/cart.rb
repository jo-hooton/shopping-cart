class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items

  def total_amount
    format('$%.2f', cart_items.unpaid.sum { |cp| cp.product.price * cp.quantity })
  end

  def empty?
    cart_items.unpaid.empty?
  end
end
