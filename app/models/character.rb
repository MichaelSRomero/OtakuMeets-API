class Character < ApplicationRecord
  has_many :users
  has_many :avatars
  belongs_to :personality

  def personality_type
    Personality.find(self[:personality_id]).title
  end

  def avatars
    avatars = Avatar.all.select {|avatar| avatar.character == self}
    avatars.map {|avatar| avatar[:image_url]}
  end
end
