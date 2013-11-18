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
	end

	def destroy
		
	end

	private
		def student_params
			params.require(:student).permit(:name, :student_id)
		end
end