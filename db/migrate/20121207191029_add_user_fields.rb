class AddUserFields < ActiveRecord::Migration
  def change
    remove_column :users, :password	
    add_column :users, :password_digest, :string
    add_column :users, :surname, :string
    add_column :users, :email, :string
    add_column :users, :image_path, :string
    add_column :users, :description, :string
    add_column :users, :web, :string
  end
end
