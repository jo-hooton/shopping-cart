class CartItemsController < ApplicationController
  before_action :set_cart

  def create
    @cart_item = @cart.cart_items.find_or_initialize_by(product_id: params[:product_id])

    @cart_item.quantity += 1 unless @cart_item.new_record?

    if @cart_item.save
      respond_to do |format|
        format.html { redirect_to products_path, flash: { success: 'Product added to cart' } }
        format.turbo_stream { flash.now[:success] = 'Product added to cart' }
      end
    else
      redirect_to products_path, status: :unprocessable_entity
    end
  end

  private

  def set_cart
    @cart = Cart.find(session[:cart_id])
  end
end
