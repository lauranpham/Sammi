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

  def color
    num = self.number
    case num
    when 1 then '#A33141'
    when 2 then '#F08853'
    when 3 then '#EEDD9D'
    when 4 then '#6B92AB'
    when 5 then '#D0FBDF'
    end
  end

end
