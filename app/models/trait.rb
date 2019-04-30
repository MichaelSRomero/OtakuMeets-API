class Trait < ApplicationRecord
  has_many :answers
  belongs_to :personality
end
