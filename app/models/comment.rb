class Comment < ActiveRecord::Base
  belongs_to :post

  validate :post_should_be_created
  validates :commenter,  :presence => true
  validates :body, :presence => true
  def post_should_be_created
    errors.add(:post, "is not created yet") if post && !post.created?
  end

  
end
