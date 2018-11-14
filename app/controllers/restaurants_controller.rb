class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new # keeps user input to avoid writing everything again when error
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    # Longer way to access the reviews for a specifique restaurant
    # @review = Review.where(restaurant_id: params[:id])
    @reviews = @restaurant.reviews
  end

  def destroy
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
