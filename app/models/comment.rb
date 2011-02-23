class Comment < ActiveRecord::Base
  belongs_to :post

  validate :post_should_be_created
  def post_should_be_created
    errors.add(:post, "is not created yet") if post && !post.created?
  end

  
end
