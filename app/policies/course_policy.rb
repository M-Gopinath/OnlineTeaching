class CoursePolicy < ApplicationPolicy
  def has_authorization?
    user.admin? or user.is_super_admin? or user.teacher? or record.user == user
  end
  alias_method :create?, :has_authorization?
  def own_course? 
    user.admin? or user.is_super_admin? or record.users.where(id: user.id).present?
  end
end
