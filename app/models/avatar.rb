class Avatar < ApplicationRecord
  belongs_to :character
  # Presence Validation
  validates :image_url, presence: true
end
