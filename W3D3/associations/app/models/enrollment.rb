class Enrollment < ApplicationRecord
  belongs_to :user,
    primary_key: :id,
    class_name: :User,
    foreign_key: :student_id


  belongs_to :course,
    primary_key: :id,
    class_name: :Course,
    foreign_key: :course_id
end
