class SubjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def show?
  end
end
# current_user => user
# @restaurant => record
