class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w{Fiction Non-Fiction},
  message: "%{value} is not a valid size" }
  validate :non_clickbait

private
def non_clickbait
  if title == "Won't Believe"
    errors.add(:title, "cannot be clickbaity!")
  elsif title == "Secret"
    errors.add(:title, "cannot be clickbaity!")
  elsif title == "Top [number]"
      errors.add(:title, "cannot be clickbaity!")
  elsif title == "True Facts"
    errors.add(:title, "cannot be clickbaity!")
  elsif title == "Guess"
    errors.add(:title, "cannot be clickbaity!")
  end
end

end

Post.create(title: "post1").valid? # => true
Post.create(title: nil).valid? # => false
