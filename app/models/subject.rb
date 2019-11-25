class Subject < ApplicationRecord
  belongs_to :user
  has_many :class_memberships
  validates :name, presence: true
  validates :user, presence: true
end
