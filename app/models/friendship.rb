class Friendship < ApplicationRecord
  belongs_to :sender, class_name: User
  belongs_to :acceptor, class_name: User

  def self.get_user_friendships(user)
    accepted_friends = []
    friend_ship= user.friendships.where(accepted: "true")
    friend_ship.each do |friend|
      accepted_friends << friend.acceptor
    end
    accepted_friends
  end

  def self.user_pending_friendships(user)
    pending_friends = []
    friend_ship = user.friendships.where(accepted: "false")
    friend_ship.each do |friend|
      pending_friends << friend.acceptor
    end
    pending_friends
  end

end
