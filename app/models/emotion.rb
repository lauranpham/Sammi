class Emotion < ApplicationRecord
  has_many :daily_emotions
  validates :rating, presence: true
end
