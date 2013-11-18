class Student < ActiveRecord::Base
	belongs_to :user
	has_many :behaviors, dependent: :destroy
	validates :user_id, presence: true
	validates :name, presence: true
	validates :student_id, presence: true, uniqueness: true
end
