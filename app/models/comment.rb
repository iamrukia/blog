class Comment < ActiveRecord::Base
  belongs_to :post

  validate :post_should_be_created
  def post_should_be_created
    errors.add(:post, "is not created yet") if post && !post.created?
  end

  def after_create
    puts "we will notify the author in Chapter 9"
  end
end
