class ClassMembership < ApplicationRecord
  belongs_to :user
  belongs_to :subject
end
