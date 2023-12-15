# frozen_string_literal: true

class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items

  delegate :count, to: :cart_items

  def total_amount
    cart_items.reduce(0) do |acc, item|
      acc + (item.product.price * item.quantity)
    end.to_i
  end

  def add!(itemm)
    found_item = cart_items.find { |item| item.product == itemm.product }
    # 如果有就印出來，沒有就nil
    if found_item
      found_item.increment!(:quantity, itemm.quantity)
    else
      cart_items << itemm
    end
  end
end
