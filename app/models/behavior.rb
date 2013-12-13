class Behavior < ActiveRecord::Base
	belongs_to :student
	default_scope -> { order('record_time DESC') }
	validates :student_id, presence: true

	
end
