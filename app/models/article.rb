class Article < ApplicationRecord
  validates :title, presence: true
  validates :summary, presence: true, length: { maximum: 200 }
  validates :body, presence: true
  validates :link, presence: true
end
