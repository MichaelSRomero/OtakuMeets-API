class MessagesController < ApplicationController
  # POST /messages
  def create
    @message = Message.new(message_params)
    
    if @message.save
      @conversation = @message.conversation
      render json: MessageSerializer.new(@message), status: :created, location: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_messages
      @message = Message.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def message_params
      params.require(:message).permit(:user_id, :conversation_id, :content)
    end
end
