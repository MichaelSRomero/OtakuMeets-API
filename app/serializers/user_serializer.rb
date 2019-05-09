class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :gender, :preference, :username, :age, :confirmed_matches
  has_one :character
  # has_many :liked_by_users
  # has_many :likes

  def confirmed_matches
    unserialized = self.object.likes.select { |user| user.likes.include?(self.object) }
    serialize_matches(unserialized)
  end

  private

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
