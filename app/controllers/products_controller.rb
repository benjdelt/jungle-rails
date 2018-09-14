class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @reviews = Review.where(product_id: params[:id])
    @average = @reviews.average(:rating)
  end

  def get_user id 
    User.where(id: id)
  end 
  helper_method :get_user

end
