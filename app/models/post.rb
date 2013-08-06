class Post < ActiveRecord::Base
  attr_accessible :author, :content, :dislike, :like, :neutral, :pubtime, :source, :title, :user_id, :weight
  belongs_to :user
  has_many :users, :through => :evaluates
  has_many :evaluates
  def self.rand_id
    1 + rand(7608)
  end
end
