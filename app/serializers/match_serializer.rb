class MatchSerializer < ActiveModel::Serializer
  attributes :id, :matcher, :matchee
  belongs_to :matchee
  belongs_to :matcher

  # def matcher
  #   matcherObj = self.object.matcher
  #
  #   {
  #     id: matcherObj.id,
  #     username: matcherObj.username,
  #     gender: matcherObj.gender,
  #     likes: likes(matcherObj)
  #   }
  # end
  #
  # def matchee
  #   matcheeObj = self.object.matchee
  #
  #   {
  #     id: matcheeObj.id,
  #     username: matcheeObj.username,
  #     gender: matcheeObj.gender,
  #     likes: likes(matcheeObj)
  #   }
  # end
  #
  # private
  #
  # def likes(user)
  #   user.likes.map do |like_user|
  #     {
  #       id: like_user.id,
  #       username: like_user.username,
  #       gender: like_user.gender
  #     }
  #   end
  # end

end
