class User < ApplicationRecord
  validates :username, presence: true
  validates :username, uniqueness: true

  has_many :artworks,
    class_name: :Artwork,
    foreign_key: :artist_id

  has_many :viewed_artwork,
    class_name: :ArtworkShare,
    foreign_key: :viewer_id

  has_many :shared_artworks,
    through: :viewed_artwork,
    source: :artwork

  has_many :comments,
    foreign_key: :user_id,
    class_name: :Comment,
    dependent: :destroy
end
