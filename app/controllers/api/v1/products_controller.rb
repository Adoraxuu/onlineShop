# frozen_string_literal: true

module Api
  module V1
    class ProductsController < ApplicationController
      before_action :find_product, only: [:like]
      before_action :authenticate_user!

      def like
        if current_user.liked?(@product)
          # 移除喜歡
          current_user.liked_products.destroy(@product)
          render json: { id: params[:id], status: 'unliked' }
        else
          # 加入喜歡
          current_user.liked_products << @product
          render json: { id: params[:id], status: 'liked' }
        end
      end

      private

      def find_product
        @product = Product.find(params[:id])
      end
    end
  end
end
