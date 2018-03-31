class ArticlesSerializer < ActiveModel::Serializer
  attributes :id, :title, :summary, :body
  #belongs_to :user
  #has_many :comments, dependent: :destroy

  def body
    object.body.truncate(500)
  end
end
