class Conversation < ApplicationRecord
  has_many :messages
  
  # A User who SENDS Messages
  belongs_to :user_a, class_name: 'User'
  # A User who RECIEVES Messages
  belongs_to :user_b, class_name: 'User'
end
