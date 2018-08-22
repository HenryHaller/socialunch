class LunchDatePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    user == record.request1.user || user == record.request2.user
  end

end
