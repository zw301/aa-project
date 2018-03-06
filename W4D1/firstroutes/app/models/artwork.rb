class Artwork < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :image_url, presence: true, uniqueness: true
  validates :artist_id, presence: true, uniqueness: true


  belongs_to :artist,
    class_name: :User,
    foreign_key: :artist_id

  has_many :artwork_shares,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare

  has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer

  has_many :comments,
    foreign_key: :artwork_id,
    class_name: :Comment,
    dependent: :destroy
end
