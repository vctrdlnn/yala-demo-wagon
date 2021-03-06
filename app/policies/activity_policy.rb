class ActivityPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true # tous les users peuvent creer un trip
  end

  def show?
    true # tous les users peuvent creer un trip
  end

  def update?
    user_is_owner_or_admin?
  end

  def destroy?
    user_is_owner_or_admin?
  end

  def pin?
    user_is_logged?
  end

  def copy?
    user_is_logged?
  end

  def change_position?
    user_is_owner_or_admin?
  end

  private

  def user_is_logged?
    user
  end

  def user_is_owner_or_admin?
    # TODO: seul le user peut modifier le resto
    # record => @trip
    # user => current_user
    user.admin || record.user == user || record.trip.user == user
  end

end
