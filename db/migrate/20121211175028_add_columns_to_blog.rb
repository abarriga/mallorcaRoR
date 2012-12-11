class AddColumnsToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :name, :string	
    add_column :blogs, :ext_url, :string
  end
end
