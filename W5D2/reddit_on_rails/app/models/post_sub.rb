class PostSub < ApplicationRecord

  belongs_to :post
  belongs_to :sub

  # has_one :posted_sub,
  # through: :posts,
  # source: :sub
  #
  #
  # has_many :sub_posts,
  # through: :sub,
  # source: :posts


end
