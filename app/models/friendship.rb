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

# friends = Friendship.new(sender_id: 1, acceptor_id: 2)
# user2 = User.new(email:'h@e.com', password: 'password')
# user = User.new(email: 'j@e.com', password: 'password')
