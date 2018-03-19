class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :summary, presence: true, length: { maximum: 200 }
  validates :body, presence: true
  validates :link, presence: true
end
