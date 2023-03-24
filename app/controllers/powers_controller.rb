class PowersController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        powers = Power.all
        render json: powers.to_json(except: [:created_at, :updated_at])
    end
  
    def show
      power = find_power
      render json: power.to_json(except: [:created_at, :updated_at])
    end
    
    def update
        power = find_power
        power.update!(power_params)
        render json: power.to_json(except: [:created_at, :updated_at]), status: :created
    end

  private
  
    def find_power
      Power.find(params[:id])
    end
  
    def power_params
      params.permit(:name, :description)
    end
  
    def render_not_found_response
      render json: { error: "power not found" }, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
  
end
