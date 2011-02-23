class Post < ActiveRecord::Base
  validates :name,  :presence => true
  validates :title, :presence => true,
                    :length => { :minimum => 5 }
  has_many :comments, :dependent=> :destroy
  has_many :tags
  belongs_to :user
  has_and_belongs_to_many :categories

  accepts_nested_attributes_for :tags, :allow_destroy=> :true, :reject_if=> proc{|attrs| attrs.all? {|k,v| v.blank?}}

  scope :created, where("posts.created_at IS NOT NULL")
  scope :draft, where("posts.created_at IS NULL")
  scope :recent, lambda {created.where("posts.created_at > ?", 1.week.ago.to_date)}
  scope :where_title, lambda { |term| where("posts.title LIKE ?", "%#{term}%")}

  def long_title
    "#{title} - #{created_at}"
  end

  def created?
    created_at.present?
  end

  def owned_by?(owner)
    return false unless owner.is_a? User
    user == owner
  end
end
