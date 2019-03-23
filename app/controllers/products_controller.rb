class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @avg_rating = Review.where(product_id: @product.id).average(:rating)
    @count = Review.where(product_id: @product.id).count(:rating)
  end

end
