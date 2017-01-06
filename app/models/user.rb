class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, foreign_key: :author_id
  has_many :receivers, through: :posts
  has_many :friendships, foreign_key: :sender_id
  has_many :acceptors, through: :friendships, foreign_key: :acceptor_id

  def self.find_author(post)
    author = User.find_by(id: post.author_id)
    author.first_name
  end
end
