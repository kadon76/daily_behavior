class Student < ActiveRecord::Base
	belongs_to :user
	validates :user_id, presence: true
	validates :name, presence: true
	validates :student_id, presence: true, uniqueness: true
end
