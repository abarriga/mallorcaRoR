class Blog < ActiveRecord::Base
  attr_accessible :image_path, :image_path_home, :long_desc, :short_desc, :title, :topic_id, :name, :ext_url, :user_id
  
  belongs_to :topic
  
  validates :image_path, :presence => true
  validates :long_desc, :presence => true
  validates :short_desc, :length => {:minimum => 110, :maximum => 220}, :presence => true
  validates :title, :presence => true
  validates :ext_url, :presence => true
  validates :name, :presence => true, :uniqueness => true, :on => :create
end
