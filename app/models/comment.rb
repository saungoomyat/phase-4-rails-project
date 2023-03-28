class UserPost < ApplicationRecord
    belongs_to :user
    belongs_to :post
  
    validates :content, length: { maximum: 20 }
  end
