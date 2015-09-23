class TaskPolicy < ApplicationPolicy

  def edit?
    user.id == record.user_id
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end
  
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user_id: @user.id)
      end
    end
  end
end
