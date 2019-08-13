class ActivityAnswer < ApplicationRecord
	belongs_to :activity_question, optional: true
end
