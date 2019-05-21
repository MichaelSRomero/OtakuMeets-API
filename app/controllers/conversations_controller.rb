class ConversationsController < ApplicationController

  # GET /conversations
  def index
    @conversations = Conversation.all

    render json: @conversations
  end

  # POST /conversations
  # Conversation must be created along with a message
  def create
    @conversation = Conversation.new(conversation_params)
    if @conversation.save
      @message = Message.create(user: @conversation.user_a, conversation: @conversation, content: params[:content])

      render json: ConversationSerializer.new(@conversation), status: :created, location: @conversation
    else
      render json: @conversation.errors, status: :unprocessable_entity
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def conversation_params
    params.require(:conversation).permit(:user_a_id, :conversation_id, :user_b_id)
  end

end
