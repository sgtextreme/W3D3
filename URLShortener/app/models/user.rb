class User < ApplicationRecord
  validates :email, presence: true

  belongs_to :visited_urls,
    class_name: 'ShortenedUrl'
    foreign_key: :short_url,
    primary_key: :short_url 
end
