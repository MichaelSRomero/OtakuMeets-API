class Trait < ApplicationRecord
  has_many :answers
  has_many :trait_combinations
  has_many :personalities, through: :trait_combinations
end
