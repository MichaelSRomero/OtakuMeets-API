class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :gender, :preference, :username, :age, :confirmed_matches, :conversations
  has_one :character
  # has_many :liked_by_users
  has_many :likes

  def confirmed_matches
    unserialized = self.object.likes.select { |user| user.likes.include?(self.object) }
    serialize_matches(unserialized)
  end

  def conversations
    # serialize_matches(self.object.senders + self.object.recipients)
    # Serialize Conversations
    # Make sure only Messages from that conversation appear
    recipient_convos = self.object.recipient_conversations.map do |recipient_convo|
      {
        user: serialize_user(recipient_convo.user_b),
        messages: serialize_messages(recipient_convo.messages)
      }
    end

    sender_convos = self.object.sender_conversations.map do |sender_convo|
      {
        user: serialize_user(sender_convo.user_a),
        messages: serialize_messages(sender_convo.messages)
      }
    end

    recipient_convos + sender_convos
  end

  private

  def serialize_messages(messages)
    messages.map do |message|
      MessageSerializer.new(message)
    end
  end

  def serialize_user(user)
    character = getCharacter(user.character)
    {
      id: user.id,
      email: user.email,
      gender: user.gender,
      username: user.username,
      age: user.age,
      character: character
    }
  end

  def serialize_matches(users)
    users.map do |user|
      character = getCharacter(user.character)
      {
        id: user.id,
        email: user.email,
        gender: user.gender,
        username: user.username,
        age: user.age,
        character: character
      }
    end
  end

  def getCharacter(character)
    {
      english_name: character.english_name,
      japanese_name: character.japanese_name,
      alias: character.alias,
      show: character.show,
      personality: character.personality.title,
      avatar_urls: character.avatar_urls
    }
  end

end
