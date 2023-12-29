class Public::OrdersController < ApplicationController
  before_action :check_cart_items, only: [:new]
  before_action :address_select_function, only: [:confirm]

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def new

  end

  def complete

  end

  def confirm
    @cart_items = current_customer.cart_items
  end

  def create
    @order = current_customer.orders.new(order_params)
    if @order.save!
      @order.creating_order_details(@order, current_customer)
    end
    cart_items = current_customer.cart_items
    cart_items.destroy_all
    redirect_to orders_complete_path
  end

  private

  def address_select_own
    @order.name = current_customer.family_name + current_customer.given_name
    @order.address = current_customer.address
    @order.zip_code = current_customer.zip_code
  end

  def address_select_registered_own
    receive_address = Address.find(params[:order][:select_id])
    @order.zip_code = receive_address.zip_code
    @order.name = receive_address.name
    @order.address = receive_address.address
  end

  def address_select_function
    # @order = Order.new(order_params)
    # @order.customer_id = current_customer.id
    @order = current_customer.orders.new(order_params)
    if params[:order][:address_select] == "0"
      address_select_own
    elsif params[:order][:address_select] == "1"
      address_select_registered_own
    elsif @order.invalid? #order.valid?するとbelongs_to customerの外部キー customer_idにもvaildationがかかる
      render :new
    end
  end

  def check_cart_items
    unless current_customer.cart_items.present?
      redirect_to cart_items_path
    end
  end

  def order_params
    params.require(:order).permit(:zip_code, :address, :name, :payment_method, :postage, :total_payment)
  end
end
