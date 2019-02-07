class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :link
  
  scope :newest,-> { order(created_at: :desc) }
  
  validates :body, 
            length: { minimum: 3, maximum:1000 }, 
            allow_blank: false, 
            presence: true
end
