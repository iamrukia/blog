require 'digest'
class User < ActiveRecord::Base
  attr_accessor :password
  has_one :profile
  has_many :posts, :order => 'created_at DESC, title ASC', :dependent => :destroy
  has_many :replies, :through => :posts, :source => :comments

  validates :email, :uniqueness => true
  validates :password, :confirmation => true, :presence => true, :if => :password_required?


  before_save :encrypt_new_password

  def self.authenticate(email, password)
    user = find_by_email(email)
    return user if user && user.authenticated?(password)
  end

  def authenticated?(password)
    self.hashed_password == encrypt(password)
  end

  protected
    def encrypt_new_password
      return if password.blank?
      self.hashed_password = encrypt(password)
    end

    def password_required?
      hashed_password.blank? || password.present?
    end

    def encrypt(string)
      Digest::SHA1.hexdigest(string)
    end
end
