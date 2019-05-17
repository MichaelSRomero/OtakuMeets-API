class Character < ApplicationRecord
  has_many :users
  has_many :avatars
  belongs_to :personality

  def avatar_urls
    self.avatars.map { |avatar| avatar[:image_url] }
  end
end
