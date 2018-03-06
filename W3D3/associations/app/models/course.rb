class Course < ApplicationRecord
  has_many :enrollments,
    primary_key: :id,
    foreign_key: :course_id,
    class_name: :Enrollment

  has_many :enrolled_students,
    through: :enrollments,
    source: :user

  belongs_to :instructor,
    primary_key: :id,
    class_name: :User,
    foreign_key: :instructor_id

  belongs_to :prerequisite,
    primary_key: :id,
    class_name: :Course,
    foreign_key: :prereq_id

end
