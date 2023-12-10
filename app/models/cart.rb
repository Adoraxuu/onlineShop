class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items

  delegate :count, to: :cart_items

  def count
    cart_items.count
  end

  def add!(t)
    found_item =  cart_items.find {|item| item.product == t.product}
    #如果有就印出來，沒有就nil
    if found_item
      found_item.increment!(:quantity, t.quantity)
    else
      cart_items << t
    end
  end
end
