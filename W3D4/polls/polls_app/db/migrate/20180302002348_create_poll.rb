class CreatePoll < ActiveRecord::Migration[5.1]
  def change
    create_table :polls do |t|
      t.string :title, index: true, unique: true
      t.integer :user_id
      t.timestamps
    end
  end
end
