class PersonalitiesController < ApplicationController

  # GET /personalities
  def index
    @personalities = Personality.all

    render json: @personalities
  end

  # GET /personalities/esfp
  def show
    personality_name = params[:type].upcase
    @personality = Personality.find_by(title: personality_name)
    render json: @personality
  end

end
