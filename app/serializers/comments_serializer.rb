class CommentsSerializer < ActiveModel::Serializer
  attributes :id, :commenter, :body, :created_at
end
