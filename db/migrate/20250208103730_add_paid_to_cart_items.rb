class AddPaidToCartItems < ActiveRecord::Migration[8.0]
  def change
    add_column :cart_items, :paid, :boolean, null: false, default: false
  end
end
