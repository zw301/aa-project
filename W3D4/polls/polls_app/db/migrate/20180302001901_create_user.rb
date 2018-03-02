class CreateUser < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :user_name, index: true, unique: true
      t.timestamps
    end
  end
end
