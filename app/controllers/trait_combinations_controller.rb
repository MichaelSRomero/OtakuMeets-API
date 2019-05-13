class TraitCombinationsController < ApplicationController

  # POST /trait_combinations
  def create
    @trait_combination = TraitCombination.new(trait_combination_params)

    if @trait_combination.save
      render json: @trait_combination, status: :created, location: @trait_combination
    else
      render json: @trait_combination.errors, status: :unprocessable_entity
    end
  end


  private
    # Only allow a trusted parameter "white list" through.
    def trait_combination_params
      params.fetch(:trait_combination, {})
    end
end
