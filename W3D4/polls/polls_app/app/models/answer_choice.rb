# == Schema Information
#
# Table name: answer_choices
#
#  id          :integer          not null, primary key
#  text        :text
#  question_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class AnswerChoice < ApplicationRecord

  belongs_to :question,
    foreign_key: :question_id,
    primary_key: :id,
    class_name: :Question

  has_many :responses,
    foreign_key: :answer_choice_id,
    primary_key: :id,
    class_name: :Response
end
