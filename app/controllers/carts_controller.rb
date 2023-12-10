class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_product, only: [:create]

  def create
    redirect_to @product, notice: "成功加入購物車"
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end
end
