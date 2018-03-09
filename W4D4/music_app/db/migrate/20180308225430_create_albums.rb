class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :name, null: false
      t.integer :band_id, null: false, index: true
      t.integer :year, null: false
      t.boolean :live, default: false,  null: false

      t.timestamps
    end
  end
end
