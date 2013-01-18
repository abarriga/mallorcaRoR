class Task < ActiveRecord::Base
  attr_accessible :description, :finished, :title, :user_id
  
  validates :title, :presence => true
  validates :description, :presence => true
end
