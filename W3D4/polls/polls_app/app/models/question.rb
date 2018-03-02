# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  text       :text
#  poll_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord
  belongs_to :poll,
    foreign_key: :poll_id,
    primary_key: :id,
    class_name: :Poll

  has_many :answer_choices,
    foreign_key: :question_id,
    primary_key: :id,
    class_name: :AnswerChoice
  
  # has_many :responses,
  #   through: :answer_choices,
  #   source: :responses

end
