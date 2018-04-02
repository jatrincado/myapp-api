class ArticlesSerializer < ActiveModel::Serializer
  attributes :id, :title, :summary, :body, :created_at
  #belongs_to :user
  #has_many :comments, dependent: :destroy

  def body
    object.body.truncate(500)
  end
end
