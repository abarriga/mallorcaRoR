class CreateMeetups < ActiveRecord::Migration
  def change
    create_table :meetups do |t|
      t.string :title
      t.datetime :date
      t.text :description
      t.integer :user_id
      t.text :place

      t.timestamps
    end
  end
end
