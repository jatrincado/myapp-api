class ArticlesSerializer < ActiveModel::Serializer
  attributes :id, :title
  attribute :summary, key: :subtitle
  attributes :body, :created_at
  #belongs_to :user
  #has_many :comments, dependent: :destroy

  def body
    object.body.truncate(500)
  end
end
