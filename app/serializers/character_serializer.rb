class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :english_name, :japanese_name, :gender, :alias, :show, :personality, :avatar_urls
  has_many :users
  # has_many :avatars

  def personality
    Personality.find(self.object[:personality_id]).title
  end
end
