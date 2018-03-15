class Post < ApplicationRecord
  validates :title, presence: true

  belongs_to :author,
  foreign_key: :user_id,
  class_name: :User

  has_many :post_subs,
  foreign_key: :post_id,
  class_name: :PostSub,
  inverse_of: :post

  has_many :subs,
  through: :post_subs

  has_many :comments

end
