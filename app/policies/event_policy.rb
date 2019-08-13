class EventPolicy < ApplicationPolicy
  def own_event?
    user.admin? or user.is_super_admin? or record.user_id == user.id
  end
end