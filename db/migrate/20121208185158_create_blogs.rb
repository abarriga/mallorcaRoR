class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :image_path
      t.text :long_desc
      t.string :short_desc
      t.string :title
      t.integer :topic

      t.timestamps
    end
  end
end
