class StudentsController < ApplicationController
	before_action :signed_in_user

	def new
		@student = Student.new
	end

	def create
		@student = current_user.students.build(student_params)
    	if @student.save
      		flash[:success] = "Student created!"
      		redirect_to root_url
    	else
      		render 'static_pages/home'
    	end
	end

	def show
		@student = Student.find(params[:id])
		@user = User.find_by(id: @student.user_id)
		@behaviors = @student.behaviors.paginate(page: params[:page])
		@todaysBehaviors = todays_behaviors()
		if !@todaysBehaviors.any?
			(0..3).each do |i|
				@todaysBehaviors[i] = 0
			end
		end
		@thisWeeksBehaviors = this_weeks_behaviors()
		if !@thisWeeksBehaviors.any?
			(0..3).each do |i|
				@thisWeeksBehaviors[i] = 0
			end
		end

			
	end

	def show_graph
		@student = Student.find(params[:id])
		@user = User.find_by(id: @student.user_id)
		@behaviors = @student.behaviors.paginate(page: params[:page])
		@todaysBehaviors = todays_behaviors()
		if !@todaysBehaviors.any?
			(0..3).each do |i|
				@todaysBehaviors[i] = 0
			end
		end
		@thisWeeksBehaviors = this_weeks_behaviors()
		if !@thisWeeksBehaviors.any?
			(0..3).each do |i|
				@thisWeeksBehaviors[i] = 0
			end
		end	
	end

	def destroy
    	    	
  	end

	private
		def student_params
			params.require(:student).permit(:name, :student_id)
		end

		def todays_behaviors(t = Time.now)
			dailys = @student.behaviors.where(
					"record_time > ? AND record_time < ?", 
						t.at_beginning_of_day, t.tomorrow.at_beginning_of_day)
							.pluck(:pos1, :neg1, :neg2, :cor1).to_a
			dailys.transpose.map &:sum
		end

		def this_weeks_behaviors(t = Time.now)
			weeklys = @student.behaviors.where(
					"record_time > ? AND record_time < ?", 
						1.week.ago.at_beginning_of_week, 1.week.ago.at_end_of_week)
							.pluck(:pos1, :neg1, :neg2, :cor1).to_a
			@thisWeeksTotal = weeklys.count
			weeklys.transpose.map &:sum
		end
end