class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, geater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, geater_than_or_equal_to: 0 }

  has_many :likes
  has_many :comments
  belongs_to :author, class_name: 'User'
  after_save :update_counter

  def update_counter
    author.increment!(:posts_counter)
  end

  def recent_comments
    comments.order(created_at: :asc).limit(5)
  end
end
