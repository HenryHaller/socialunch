class LunchRequestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    create?
  end
  def create?
    true  # Anyone can create a restaurant
  end

  def update?
    record.user == user
  end

  def show?
    record.user == user
  end

  def destroy?
    record.user == user
  end

end
