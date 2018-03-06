class CreateShortenedUrl < ActiveRecord::Migration[5.1]
  def change
    create_table :shortened_urls do |t|
      t.string :long_url, index: true
      t.string :short_url
      t.integer :user_id
    end
  end
end
