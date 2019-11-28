class AppointmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end

    def index?
      create?
    end

    def show?
      create?
    end

    def create?
      record.user == user && user.teacher
    end

    def destroy?
      create?
    end
  end
end
