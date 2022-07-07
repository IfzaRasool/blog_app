class Post < ApplicationRecord
  has_many :likes
  has_many :comments
  belongs_to :author, class_name: 'User'

  def update_counter
    author.increment!(:posts_counter)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
