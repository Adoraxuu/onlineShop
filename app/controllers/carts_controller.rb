class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_product, only: [:create]

  def show
  end

  def create
    #render html:params 查看送出的東西
    item = CartItem.new(product: @product, quantity: params[:quantity])
    current_cart.add!(item)
    redirect_to @product, notice: "成功加入購物車"
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end
end
