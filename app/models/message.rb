class Message < ApplicationRecord
  belongs_to :Conversation
  belongs_to :User
end
