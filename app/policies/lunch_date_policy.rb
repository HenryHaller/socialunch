class LunchDatePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    scope.where(:id => record.id).exists? && ( user == record.user || user == record.second_user )
  end

end
