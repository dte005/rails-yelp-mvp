class ReviewsController < ApplicationController
  # before_action :find_reviews, only: %i[show edit update destroy]
  def index
    @reviews = Review.all
  end

  # def show
  # end

  # def edit
  # end

  # def update
  #   @review.update(set_params)
  #   redirect_to review_path(@review)
  # end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(set_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to @restaurant, notice: 'Review was succesfully created'
    else
      render :new
    end
    # redirect_to restaurant_path(@restaurant)
  end

  # def destroy
  #   @review.destroy
  #   redirect_to reviews_path
  # end

  private

  def find_reviews
    @review = Review.find(params[:id])
  end

  def set_params
    params.require(:review).permit(:content, :rating)
  end
end
