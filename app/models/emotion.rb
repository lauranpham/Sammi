class Emotion < ApplicationRecord
  has_many :daily_emotions
  validates :rating, presence: true
  enum rating: { "🙁" => 1,
                 "😕" => 2,
                 "😐" => 3,
                 "🙂" => 4,
                 "😁" => 5 }
  def name
    rating
  end

  def number
    rating_hash = { "🙁" => 1,
                 "😕" => 2,
                 "😐" => 3,
                 "🙂" => 4,
                 "😁" => 5 }
    rating_hash[self.rating]
  end
end
