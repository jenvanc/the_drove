module PostHelper

  def find_author_of_post(post)
    User.find_author(post)
  end
end
