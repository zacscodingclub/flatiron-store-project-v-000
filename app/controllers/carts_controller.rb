class CartsController < ApplicationController
  def show
    @cart = Cart.find(params[:id])
  end

  def checkout
    @cart = Cart.find(params[:id])
    @cart.checkout
    @cart.save
    @user = current_user
    @user.current_cart = nil
    @user.save
    redirect_to @cart
  end
end
