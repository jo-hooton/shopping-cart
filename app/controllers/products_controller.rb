class ProductsController < ApplicationController
  before_action :set_cart
  def index
    @products = Product.all
  end

  private

  # def set_cart
  #   @cart = Cart.find_by(id: session[:cart_id])

  #   if @cart.nil?
  #     @cart = Cart.create
  #     session[:cart_id] = @cart.id  # Store cart_id in session
  #   end
  # end

  def set_cart
    @cart = Cart.find_by(id: session[:cart_id]) || Cart.create
    session[:cart_id] ||= @cart.id
  end
end
