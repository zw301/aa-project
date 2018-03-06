class ShortenedUrl < ApplicationRecord
  validates :long_url, presence: true, uniqueness: true
    # validates :user_id, presence: true


  def self.random_code
    short_url = SecureRandom.urlsafe_base64

    unless ShortenedUrl.exists?(short_url: short_url)
      short_url = SecureRandom.urlsafe_base64
    end
    short_url
  end

  def self.create_shortened_url(user, long_url)

    short_url = ShortenedUrl.random_code
    ShortenedUrl.new(long_url: long_url, short_url: short_url, user_id: user.id)
  end

  def num_clicks
    self.visits.count
  end

  def num_uniques
    self.visits.select(:user_id).distinct.count
  end

  def num_recent_uniques
  end

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :visits,
    primary_key: :id,
    class_name: :Visit,
    foreign_key: :short_url_id
end
