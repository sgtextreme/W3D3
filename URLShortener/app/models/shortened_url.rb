require 'securerandom'
class ShortenedUrl < ApplicationRecord
  validates :short_url, presence: true, uniqueness: true
  validates :long_url, presence: true

  def self.random_code
    short = true
    while short == true
      short_url = SecureRandom.urlsafe_base64(16, false)
      short = ShortenedUrl.exists?(:short_url => short_url)
    end
    short_url
  end

  def self.shorten(user, long_url)
    user_hash = {user_id: user, long_url: long_url, short_url: self.random_code}

    ShortenedUrl.create!(user_hash)
  end
end
