class AdminController < ApplicationController
  def destroy
    @restaurant = Restaurant.find(restaurant_id)
    @restaurant.destroy
  end
end
