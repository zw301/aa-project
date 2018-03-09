class AddIndexToAlbumsName < ActiveRecord::Migration[5.1]
  def change
    add_index :albums, :name
  end
end
