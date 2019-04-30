class Personality < ApplicationRecord
  has_many :characters
  has_many :traits
end
