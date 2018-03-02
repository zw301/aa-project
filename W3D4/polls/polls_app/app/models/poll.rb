# == Schema Information
#
# Table name: polls
#
#  id         :integer          not null, primary key
#  title      :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Poll < ApplicationRecord

  belongs_to :author,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: :User

  has_many :questions,
    foreign_key: :poll_id,
    primary_key: :id,
    class_name: :Question


end
