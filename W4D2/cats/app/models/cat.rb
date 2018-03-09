class Cat < ApplicationRecord
  validates :color, inclusion: { in: %w(White Black Yellow) }
  validates :sex, inclusion: { in: %w(M F) }
  validates :birth_date, :age, :color, :name, :sex, :description, presence: true

  has_many :rental_requests,
    class_name: :CatRentalRequest,
    foreign_key: :cat_id,
    primary_key: :id,
    dependent: :destroy

end
