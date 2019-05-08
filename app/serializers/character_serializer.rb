class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :english_name, :japanese_name, :gender, :alias, :show, :personality_type, :avatar_urls
  has_many :users
  # has_many :avatars
end
