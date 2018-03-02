# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  answer_choice_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Response < ApplicationRecord

  belongs_to :respondent,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: :User

  belongs_to :answer_choices,
    foreign_key: :answer_choice_id,
    primary_key: :id,
    class_name: :AnswerChoice
end
