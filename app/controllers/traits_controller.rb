class TraitsController < ApplicationController
  before_action :set_trait, only: [:show]

  # GET /traits
  def index
    @traits = Trait.all

    render json: @traits
  end

  # GET /traits/1
  def show
    render json: @trait
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trait
      @trait = Trait.find(params[:id])
    end
end
