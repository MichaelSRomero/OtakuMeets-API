class ConversationsController < ApplicationController

  # GET /conversations
  def index
    @conversations = Conversation.all

    render json: @conversations
  end
end
