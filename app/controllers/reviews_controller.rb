class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
    # raise
  end

  def create
    restaurant_id = restaurant_params
    review_content = review_params[:content]
    review_rating = review_params[:rating].to_i

    @restaurant = Restaurant.find(restaurant_id)

    @review = Review.new(restaurant: @restaurant, content: review_content, rating: review_rating)
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new # keeps user input to avoid writing everything again when error
    end
  end

  private

  def review_params
    params.require(:review).permit(:restaurant, :content, :rating)
  end

  def restaurant_params
    params.require(:restaurant_id).to_i
  end
end

# THOSE ARE THE PARAMS SENT IN CREATE, HENCE 2 _PARAMS FUNCTIONS
# {"utf8"=>"✓",
#  "authenticity_token"=>"NtIEcUK/AiBGF6CsBprdZCsGuyoOqcGlCgKSEj38sE3GGVeTem9zkJNDaafmx/ePRdecgMRcnznv0PhV+DD04g==",
#  "review"=>{"restaurant"=>"La Creperie", "content"=>"Good", "rating"=>"5"},
#  "commit"=>"Add a review",
#  "restaurant_id"=>"2"}
