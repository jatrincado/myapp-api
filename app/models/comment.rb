class Comment < ApplicationRecord
  belongs_to :article
  validates :commenter, presence: true
  validates :body, presence: true
  alias_attribute :author, :commenter
  alias_attribute :comment, :body
end
