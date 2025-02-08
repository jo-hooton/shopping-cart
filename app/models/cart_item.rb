class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  scope :unpaid, -> { where(paid: false) }
end
