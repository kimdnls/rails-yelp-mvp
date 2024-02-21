class RestaurantsController < ApplicationController
 # We need to find the restaurant associated with the review

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new # Needed to instantiate the form_with
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to @restaurant, notice: "Restaurant was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category)
  end
end
