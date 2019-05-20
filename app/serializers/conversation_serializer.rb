class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :sender, :recipient

  def sender
    self.object.user_a
  end

  def recipient
    self.object.user_b
  end

end
