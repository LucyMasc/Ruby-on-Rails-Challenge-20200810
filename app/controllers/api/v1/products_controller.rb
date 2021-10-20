module Api
  module V1
    class ProductsController < ApplicationController
      include ActionController::HttpAuthentication::Token::ControllerMethods
      before_action :restrict_access

      def index
        @products = Product.all
        render json: { status: 'Success', message: 'Loading all Products', data: @products }, status: :ok
      end

      def show
        @product = Product.find(params[:id])
        render json: { status: 'Success', message: 'Loading a Product', data: @product }, status: :ok
      end

      def create
        @product = Product.new(product_params)

        if @product.save!
          render json: { status: 'Success', message: 'Product successfully created', data: @product }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Not able to create a product.', data: @product }, status: :unprocessable_entity
        end
      end

      def update
        @product = Product.find(params[:id])

        if @product.update(product_params)
          render json: { status: 'Success', message: 'Product successfully updated', data: @product }, status: :ok
        else
          render json: { status: 'ERRORs', message: 'Not able to update product', data: @product }, status: :unprocessable_entity
        end
      end

      def destroy
        @product = Product.find(params[:id])
        @product.destroy
        render json: { status: 'Success', message: 'Product successfully deleted', data: @product }, status: :unprocessable_entity
      end

      private

      def restrict_access
        authenticate_or_request_with_http_token do |token, options|
          ApiKey.exists?(access_token: token)
        end
      end

      def product_params
        params.require(:product).permit(:title, :product_type, :description, :filename, :height, :width, :price, :rating)
      end
    end
  end
end
