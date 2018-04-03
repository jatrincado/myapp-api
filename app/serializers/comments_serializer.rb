class CommentsSerializer < ActiveModel::Serializer
  attributes :id
  attribute :commenter, key: :author
  attribute :body, key: :comment
  attribute :created_at
end
