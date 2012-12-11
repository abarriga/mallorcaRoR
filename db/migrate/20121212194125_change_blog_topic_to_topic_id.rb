class ChangeBlogTopicToTopicId < ActiveRecord::Migration
  def change
    remove_column :blogs, :topic	
    add_column :blogs, :topic_id, :integer
  end
end
