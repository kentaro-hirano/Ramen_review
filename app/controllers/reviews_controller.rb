class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  
  def index
    @reviews = Review.all
    @ramen_shop = RamenShop.find(params[:ramen_shop_id])
  end
  
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to ramen_shop_reviews_path(@review.ramen_shop)
    else
      @ramen_shop = Ramenshop.find(params[:id])
      render "ramen_shop/show"
    end
  end
  
  private
  def review_params
    params.require(:review).permit(:ramen_shop_id, :score, :content)
  end
end
