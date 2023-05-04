class Contact < ApplicationRecord
  validates :name, presence: true, length: {minimum:2}
  validates :email, presence: true, uniqueness: true
  validates :body, presence: true, length: {minimum: 5}
end
