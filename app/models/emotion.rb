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
    when 1 then '#F25855'
    when 2 then '#F5785A'
    when 3 then '#F7955F'
    when 4 then '#F7B363'
    when 5 then '#F7D167'
    end
  end
end

    # when 1 then '#A33141'
    # when 2 then '#F08853'
    # when 3 then '#EEDD9D'
    # when 4 then '#6B92AB'
    # when 5 then '#D0FBDF'
