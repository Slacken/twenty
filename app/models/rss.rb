class Rss < ActiveRecord::Base
  attr_accessible :home, :name, :url
  validates :url, :presence=>true
end
