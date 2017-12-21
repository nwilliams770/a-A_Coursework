class Visit < ApplicationRecord

  belongs_to :visitor,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id

  belongs_to :visited,
    class_name: :ShortenedUrl,
    primary_key: :id,
    foreign_key: :shortened_url_id



  def self.record(user, shortened_url)
    Visit.create!(user_id: user.id, shortened_url_id: shortened_url.id)
  end

end
