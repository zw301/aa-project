class User < ApplicationRecord
  has_many :enrollments,
    primary_key: :id,
    class_name: :Enrollment,
    foreign_key: :student_id

  has_many :enrolled_courses,
    primary_key: :id,
    class_name: :Enrollment,
    foreign_key: :course_id
end
