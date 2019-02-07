class Link < ApplicationRecord
  belongs_to :user
  has_many :comments
  
  scope :newest,-> { order(created_at: :desc) }
  
  validates :title,
            presence: true,
            #allow_blank: true,
            uniqueness: { case_sensitive: false },
            length: { :within => 10..200 }
            
  validates :url,
            format: { with: %r{\Ahttps?://} },
            allow_blank: true
  
  def comment_count
    comments.length
  end
end
