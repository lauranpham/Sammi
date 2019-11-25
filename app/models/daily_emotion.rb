class DailyEmotion < ApplicationRecord
  belongs_to :emotion
  belongs_to :student
  validates :emotion, presence: true
  validates :student, presence: true
end
