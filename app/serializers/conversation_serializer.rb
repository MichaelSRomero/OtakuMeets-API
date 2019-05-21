class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :sender, :recipient
  has_many :messages

  def sender
    serialize_user(self.object.object.user_a)
  end

  def recipient
    serialize_user(self.object.object.user_b)
  end

  private

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
