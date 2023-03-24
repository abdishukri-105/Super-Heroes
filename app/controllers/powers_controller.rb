class PowersController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        restaurants = Restaurant.all
        render json: restaurants.to_json(except: [:created_at, :updated_at])
    end
  
    def show
      restaurant = find_restaurant
      render json: restaurant.to_json(only: [:id, :name, :address], include: [pizzas: { except: [:created_at, :updated_at]}])
    end
    
    def destroy
      restaurant = find_restaurant
      restaurant.destroy
      head :no_content
    end
  
  
  private
  
    def find_restaurant
      Restaurant.find(params[:id])
    end
  
    def restaurant_params
      params.permit(:name, :address)
    end
  
    def render_not_found_response
      render json: { error: "restaurant not found" }, status: :not_found
    end
  
end
