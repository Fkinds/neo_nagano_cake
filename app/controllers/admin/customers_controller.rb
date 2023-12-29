class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    if customer.update(customer_params)
      redirect_to admin_customer_path(customer)
    else
      @customer = Customer.find(params[:id])
      render :edit
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:family_name, :given_name, :family_name_kana, :given_name_kane, :zip_code, :address, :phone_number, :email, :is_deleted)
  end
end
