class CatRentalRequest < ApplicationRecord
  validates :status, inclusion: { in: %w(APPROVED DENIED) }
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validate :overlapping_approved_requests

  belongs_to :cat,
    class_name: :Cat,
    foreign_key: :cat_id,
    primary_key: :id

  private

  def overlapping_requests

  end

  def overlapping_approved_requests


  end

  def does_not_overlapping_approved_requests

  end

end
