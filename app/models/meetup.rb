class Meetup < ActiveRecord::Base
  attr_accessible :date, :description, :place, :title, :user_id
  
  validates :title, :presence => true
  validates :description, :presence => true
  validates :place, :presence => true
end
