class Tag < ActiveRecord::Base
  has_and_belongs_to_many :posts
  has_many :subscriptions
  
  validates :name, :presence => true
  
  scope :popular, (lambda do |limit = 100|
    order('posts_count desc').limit(limit)
  end)
  
  def to_s
    name
  end
  
  def with_sign
    '#' << name.to_s
  end
  
  def to_param
    name
  end
end
