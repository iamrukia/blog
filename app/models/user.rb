class User < ActiveRecord::Base
  has_one :profile
  has_many :posts, :order => 'created_at DESC, title ASC', :dependent => :destroy
  has_many :replies, :through => :posts, :source => :comments

  validates :email, :uniqueness => true
  validates :password, :confirmation => true
end
