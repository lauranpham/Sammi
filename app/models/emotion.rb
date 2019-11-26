class Emotion < ApplicationRecord
  has_many :daily_emotions
  validates :rating, presence: true
  enum rating: { "☹️" => 1, "😕" => 2, "😐" => 3, "🙂" => 4, "😁" => 5 }
end
