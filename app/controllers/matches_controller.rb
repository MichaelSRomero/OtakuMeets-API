class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :destroy]

  # GET /matches
  def index
    @matches = Match.all

    render json: @matches
  end

  # GET /matches/1
  def show
    render json: @match
  end

  # POST /matches
  def create

    @match = Match.new(match_params)
    if @match.save
      render json: {mutual_match: @match.matchee.likes.include?(@match.matcher)}, status: :created, location: @match
      # render json: MatchSerializer.new(@match), status: :created, location: @match
    else
      render json: @match.errors, status: :unprocessable_entity
    end
  end

  # DELETE /matches/1
  def destroy
    @match.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def match_params
      params.require(:match).permit(:matcher_id, :matchee_id)
    end
end
