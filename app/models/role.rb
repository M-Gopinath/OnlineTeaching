class Role < ApplicationRecord
  has_many :users, dependent: :destroy
  ROLES = ["Super Admin", "Admin", "Teacher", "Student"]

  def self.super_admin
    find_by_name("Super Admin")
  end
end
