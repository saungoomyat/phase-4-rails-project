class PostSerializer < ActiveModel::Serializer
  attributes :id, :content

  has_many :comments, serializer: CommentSerializer
  belongs_to :user
end
