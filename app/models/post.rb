class Post < ApplicationRecord
  belongs_to :author, class_name: User
  belongs_to :receiver, class_name: User
  validates :body, presence: true

  def self.find_user_wall_posts(user)
    user_posts = Post.where(receiver_id: user.id).order(:created_at)
  end

end
