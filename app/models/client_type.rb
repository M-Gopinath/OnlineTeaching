class ClientType < ApplicationRecord
  SCHOOL = "School"

  def self.type(name)
    find_by_name(name).try(:id)
  end
end
