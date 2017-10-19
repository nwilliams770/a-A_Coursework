class ShortenedUrl < ApplicationRecord
  validates :short_url, uniqueness: true
  validates :long_url, :user_id, presence: true

  belongs_to :submitter,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id

  has_many :visits,
    class_name: :Visit,
    primary_key: :id,
    foreign_key: :shortened_url_id

  has_many :visitors,
    ->{ distinct },
    through: :visits,
    source: :visitor

  def self.random_code
    code = SecureRandom.urlsafe_base64

    until !(ShortenedUrl.exists?(short_url: code))
      code = SecureRandom.urlsafe_base64
    end
    code
  end

  def self.generate_shorturl(user, long_url)
    code = ShortenedUrl.random_code
    ShortenedUrl.create!(user_id: user.id, long_url: long_url, short_url: code)
  end

  def num_clicks
    visits.count
  end

  def num_uniques
    visitors.count
  end

  def num_recent_uniques
    visits = Visit.where('created_at > ?', 10.minutes.ago).where('shortened_url_id = ?', self.id)
    visits.select(:user_id).distinct.count
  end
end
