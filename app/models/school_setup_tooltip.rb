class SchoolSetupTooltip < ApplicationRecord
	def self.school_logo
    last.try(:logo).present? ? last.try(:logo).url : "/assets/logo-1.png"
  end
end
