class TraitCombinationsController < ApplicationController
  before_action :set_trait_combination, only: [:show, :update, :destroy]

  # GET /trait_combinations
  def index
    @trait_combinations = TraitCombination.all

    render json: @trait_combinations
  end

  # GET /trait_combinations/1
  def show
    render json: @trait_combination
  end

  # POST /trait_combinations
  def create
    @trait_combination = TraitCombination.new(trait_combination_params)

    if @trait_combination.save
      render json: @trait_combination, status: :created, location: @trait_combination
    else
      render json: @trait_combination.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trait_combinations/1
  def update
    if @trait_combination.update(trait_combination_params)
      render json: @trait_combination
    else
      render json: @trait_combination.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trait_combinations/1
  def destroy
    @trait_combination.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trait_combination
      @trait_combination = TraitCombination.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def trait_combination_params
      params.fetch(:trait_combination, {})
    end
end
