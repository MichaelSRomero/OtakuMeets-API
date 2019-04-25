class Match < ApplicationRecord
  # Matcher likes Matchee
  # Matchee is liked by Matcher
  #######################
  # A User who Likes you
  belongs_to :matcher, class_name: 'User'
  # Current User (You) being liked
  belongs_to :matchee, class_name: 'User'
end
