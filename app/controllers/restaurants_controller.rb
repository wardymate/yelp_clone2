class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def new

  end

  def create
    Restaurant.create(restaurant_params)
    redirect_to '/restaurants'
  end

  def restaurant_params
    params.require(:restaurant).permit(:name)
  end

  def show
    fetch_params
  end

  def edit
    fetch_params
  end

  def update
    fetch_params
    @restaurant.update(restaurant_params)
    redirect_to '/restaurants'
  end

  def fetch_params
    @restaurant = Restaurant.find(params[:id])
  end

  def destroy
    fetch_params
    @restaurant.destroy
    flash[:notice] = 'Restaurant deleted successfully'
    redirect_to '/restaurants'
  end

end
