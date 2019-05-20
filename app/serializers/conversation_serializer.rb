class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :sender, :recipient
  has_many :messages

  def sender
    self.object.user_a
  end

  def recipient
    self.object.user_b
  end

end
