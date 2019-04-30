class Personality < ApplicationRecord
  has_many :characters
  has_many :trait_combinations
  has_many :traits, through: :trait_combinations
end
