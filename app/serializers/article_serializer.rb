class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :summary, :body, :created_at
  #belongs_to :user
  #has_many :comments, dependent: :destroy


end
