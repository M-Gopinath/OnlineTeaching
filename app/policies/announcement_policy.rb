class AnnouncementPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin? or user.is_super_admin?
        scope.all
      elsif user.teacher? or record.user == user
        scope.where(user_id: user.id)
      end
    end
  end
  def has_authorization?
    user.admin? or user.is_super_admin? or user.teacher? or record.user == user
  end

  alias_method :create?, :has_authorization?

  def own_announcement?
    user.admin? or user.is_super_admin? or record.user_id == user.id
  end
end
