class Token < ActiveRecord::Base
  belongs_to :user
  attr_accessible :count, :user_id, :value
end
