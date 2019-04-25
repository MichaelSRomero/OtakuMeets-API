class Character < ApplicationRecord
  has_many :users
  has_many :avatars
end
