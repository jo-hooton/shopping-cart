class CartsController < ApplicationController
  before_action :set_cart

  def show
    @cart_items = @cart.cart_items.unpaid.order(:id).includes(:product)
  end

  def reset
    @cart.cart_items.unpaid.destroy_all

    respond_to do |format|
      format.html { redirect_to cart_path, flash: { success: 'Cart reset' } }
      format.turbo_stream { flash.now[:success] = 'Cart reset' }
    end
  end

  def checkout
    @cart.cart_items.unpaid.update_all(paid: true)

    respond_to do |format|
      format.html { redirect_to cart_path, flash: { success: 'Checkout complete' } }
      format.turbo_stream { flash.now[:success] = 'Checkout complete' }
    end
  end

  private

  def set_cart
    @cart = Cart.find_by(id: session[:cart_id])

    if @cart.nil?
      @cart = Cart.create
      session[:cart_id] = @cart.id  # Store cart_id in session
    end
  end
end
