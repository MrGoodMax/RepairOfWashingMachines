class Review < ApplicationRecord
  has_many :comments

  validates :body, presence: true, length: {minimum: 5}

  def formatted_created_at
    created_at.strftime('%Y-%m-%d %H:%M:%S')
  end
end
