class MessageSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :conversation_id, :content, :created_at

  def conversation_id
    self.object.conversation_id
  end
end
