class CartItemsController < ApplicationController
  before_action :set_cart
  before_action :set_cart_item, only: %i[update destroy]

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

  def update
    if @cart_item.update(cart_item_params)
      respond_to do |format|
        format.html { redirect_to cart_path, flash: { success: 'Product quantity updated' } }
        format.turbo_stream { flash.now[:success] = 'Product quantity updated' }
      end
    else
      redirect_to cart_path, status: :unprocessable_entity
    end
  end

  def destroy
    @cart_item.destroy
    flash.now[:notice] = 'Product removed from cart'

    respond_to do |format|
      format.html { redirect_to cart_path }
      format.turbo_stream
    end
  end

  private

  def set_cart
    @cart = Cart.find(session[:cart_id])
  end

  def set_cart_item
    @cart_item = @cart.cart_items.find(params[:id])
  end

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end
end
