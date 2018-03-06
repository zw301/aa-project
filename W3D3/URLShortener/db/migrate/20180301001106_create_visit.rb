class CreateVisit < ActiveRecord::Migration[5.1]
  def change
    create_table :visits do |t|
      t.integer :user_id, index: true
      t.integer :short_url_id, index: true
      t.timestamps
    end
  end
end
