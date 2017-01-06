class Friendship < ApplicationRecord
  belongs_to :sender, class_name: User
  belongs_to :acceptor, class_name: User

  def self.get_user_friendships(user)
    user.friendships.where(accepted: "true")
  end

  def self.user_pending_friendships(user)
    user.friendships.where(accepted: "false")
  end
end
