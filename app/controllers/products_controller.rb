class ProductsController < ApplicationController

  before_action :find_product, only: [:show] #推薦使用
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_owned_product, only: [:edit, :update, :destroy]
  # before_action :find_product, except: [:index, :new, :create]


  # 在程式執行前做



  def index
    flash[:notice] = 123
    @products = Product.all.order(id: :desc)
    # @products= Product.where(deleted_at: nil).order(id: :desc)
    # @products = Product.order(id: :desc)
    # @products = Product.where(id: :desc)
    # @products = Product.find_by(id: :desc)
    # Product
    # 不知道要寫什麼，寫all

  end

  def show
    @comment = Comment.new
    @comments = @product.comments
    #把.order(id: :desc)改寫到model
  end

  def edit
  end

  def new
    @product = Product.new
  end

  def update
    # 1.找東西
    if @product.update(product_params)
      redirect_to product_path(@product), notice: '更新成功'
    else
      render :edit
    end

  end

  def create
    # params存入資料庫
    # @product = Product.new(product_params)
    # @product.user = current_user
    @product = current_user.products.new(product_params)

    if @product.save
      # flash[:notice] = "新增商品成功"
      redirect_to root_path, notice:'新增商品成功'
    else
      render :new
      #借 app/views/products/new.html.erb渲染一次，所以表格內東西還在
      # redirect_to new_product_path
    end
  end

def destroy
  find_product
  @product.destroy
  redirect_to root_path, notice: '商品已刪除'
  # 改在modal寫以下
  # @product.update(deleted_at: Time.current)
  # redirect_to root_path, alert: '商品已刪除'
end

private

  # render html: params
# Strong Parameter
  def product_params
    params.require(:product)
          .permit(:title, :description, :price, :onsale, :cover)
  end

  def find_product
    @product = Product.find(params[:id])
  end

  def find_owned_product
    @product = current_user.products.find(params[:id])
  end
end
