class AddDiscountToCarts < ActiveRecord::Migration[8.0]
  def change
    add_column :carts, :discount, :decimal, null: false, default: 0.00
  end
end
