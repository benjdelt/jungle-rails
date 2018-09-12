class Admin::CategoriesController < ApplicationController

  def index
    @categories = Category.order(id: :desc).all
  end 

  def new
    @category = Category.new 
  end

  

  private

  def category_params
    params.require(:category).permit(:name) 
  end

end
