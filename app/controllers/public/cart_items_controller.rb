class Public::CartItemsController < ApplicationController
  before_action :checking_cart_item, only: [:create]

  def index
    @cart_items = current_customer.cart_items
  end

  def create
    # if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
    if checking_cart_item
      checking_cart_item.update(amount: checking_cart_item.amount + params[:cart_item][:amount].to_i)
    else
      cart_item = current_customer.cart_items.new(cart_item_params)
      cart_item.save
    end
    redirect_to cart_items_path
  end

  def update
    # cart_item = current_customer.cart_items.find(params[:id])
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    cart_items = current_customer.cart_items.all
    cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def checking_cart_item
    current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
  end

  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
  end
end
