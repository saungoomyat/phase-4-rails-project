class UserSerializer < ActiveModel::Serializer
  attributes :id, :username

  has_many :posts, serializer: PostSerializer
  has_many :comments, through: :posts


end
