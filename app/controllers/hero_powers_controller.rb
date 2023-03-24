class HeroPowersController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  
      def index
          restaurantspizza = RestaurantPizza.all
          render json: restaurantspizza
      end
  
      def create
          restaurant_pizza =  RestaurantPizza.create!(restaurantpizza_params)
          render json: restaurant_pizza.pizza.to_json(except: [:created_at, :updated_at]), status: :created
      end
  
  private
  
    def restaurantpizza_params
      params.permit(:price, :pizza_id, :restaurant_id)
    end
  
    def render_unprocessable_entity_response(invalid)
      render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
