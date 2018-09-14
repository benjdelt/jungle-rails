class ReviewsController < ApplicationController
  before_filter :authorize

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.product_id = params[:product_id]
    @review.save!
    redirect_to Product.find params[:product_id]
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to Product.find params[:product_id]
  end
  
  def review_params 
    params.require(:review).permit(:rating, :description, :product_id)
  end 
 
end
