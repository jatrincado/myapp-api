class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :title, presence: true
  validates :summary, presence: true, length: { maximum: 200 }
  validates :body, presence: true
  validates :link, presence: true

end
