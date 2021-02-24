class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end
  
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to ramen_shop_reviews_path(@review.ramen_shop)
    else
      render 
    end
  end
end
