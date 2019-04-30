class Character < ApplicationRecord
  has_many :users
  has_many :avatars
  belongs_to :personality
end
