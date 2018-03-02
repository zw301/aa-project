# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  user_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  has_many :authored_polls,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: :Poll

  has_many :responses,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: :Response

end
