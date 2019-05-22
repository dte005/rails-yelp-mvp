class RestaurantsController < ApplicationController
  before_action :find_params, only: %i[show edit update destroy]
  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(validate_params)
    if @restaurant.save
      # restaurant_path(@restaurant)
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
      render :new
    end
    # redirect_to restaurant_path(@restaurant)
  end

  def edit
  end

  def update
    @restaurant.update(validate_params)
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def validate_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :rating, :category)
  end

  def find_params
    @restaurant = Restaurant.find(params[:id])
  end
end
