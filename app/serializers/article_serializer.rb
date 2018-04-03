class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title
  attribute :summary, key: :subtitle
  attributes :body, :created_at
  #belongs_to :user
  #has_many :comments, dependent: :destroy


end
