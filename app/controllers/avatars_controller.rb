class AvatarsController < ApplicationController
  before_action :set_avatar, only: [:show]

  # GET /avatars
  def index
    @avatars = Avatar.all

    render json: @avatars
  end

  # GET /avatars/1
  def show
    render json: @avatar
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_avatar
      @avatar = Avatar.find(params[:id])
    end
end
