class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details

  validates :name, presence: true
  validates :address, presence: true
  validates :zip_code, presence: true

  enum payment_method: {
    credit_card: 0,
    transfer: 1
  }

  enum status: {
    入金待ち: 0,
    入金確認: 1,
    製作中: 2,
    発送準備中: 3,
    配送済み: 4
  }

  def delivery_fee
    self.postage = 800
  end

  def calculation(user)
    sum = 0
    user.cart_items.each do |cart_item|
      sum += cart_item.amount * cart_item.item.tax_price
    end
    return sum
  end

  def order_calculation(order)
    order_sum = 0
    order.order_details.each do |order_detail|
      order_sum += order_detail.amount * order_detail.item.tax_price
    end
    return order_sum
  end

  def creating_order_details(order, user)
    user.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.order_id = order.id
      @order_detail.item_id = cart_item.item_id
      @order_detail.amount = cart_item.amount
      @order_detail.price = cart_item.item.tax_price
      @order_detail.save!
    end
  end

end
