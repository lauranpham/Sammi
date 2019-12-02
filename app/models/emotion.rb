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
    when 1 then '#B49CB7'
    when 2 then '#C6A9CC'
    when 3 then '#DFD0EF'
    when 4 then '#CAC7E2'
    when 5 then '#E1E8F7'
    end
  end

end
