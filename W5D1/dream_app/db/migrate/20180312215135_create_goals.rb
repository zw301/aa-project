class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.string :title
      t.string :details
      t.boolean :private
      t.integer :user_id
      t.boolean :complete

      t.timestamps
    end
  end
end
