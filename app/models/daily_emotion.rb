class DailyEmotion < ApplicationRecord
  belongs_to :emotion
  belongs_to :student
end
