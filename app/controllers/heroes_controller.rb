class HeroesController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        heroes = Hero.all
        render json: heroes.to_json(except: [:created_at, :updated_at])
    end
  
    def show
      hero = find_hero
      render json: hero.to_json(only: [:id, :name, :super_name], include: [powers: { except: [:created_at, :updated_at]}])
    end
    
    private
  
    def find_hero
      Hero.find(params[:id])
    end
  
    def render_not_found_response
      render json: { error: "hero not found" }, status: :not_found
    end
    
end
