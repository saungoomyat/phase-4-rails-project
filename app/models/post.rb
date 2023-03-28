class Post < ApplicationRecord
    belongs_to :users
    has_many :comments

    validates :content, length: { maximum: 100 }
  end
  