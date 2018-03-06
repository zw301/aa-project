class Comment < ApplicationRecord
  validates :user_id, presence: true
  validates :artwork_id, presence: true

  belongs_to :user,
  foreign_key: :user_id,
  class_name: :User

  belongs_to :artwork,
  foreign_key: :artwork_id,
  class_name: :Artwork
end
