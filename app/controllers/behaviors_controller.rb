class BehaviorsController < ApplicationController
  def new
    @student = Student.find_by(id: session[:this_student_id])
  	@behavior = Behavior.new(pos1_name: "Positive", neg1_name: "Negative1", 
                            neg2_name: "Negative2", cor1_name: "Correction")
  end

  def create
    @student = Student.find_by(id: session[:this_student_id])
    @behaviors = params[:behaviors].values
    @behaviors.each do |behavior_params|
      @behavior = @student.behaviors.create(behavior_params)
    end
     # @behavior = @student.behaviors.create(behavior_params)
    
    # if @behavior.save
    #    flash[:success] = "Student behavior saved!"
    #    respond_to do |format|
    #      format.html { redirect_to @student }
    #      format.js
    #    end
    # else
    #    flash[:error] = "Student behavior NOT saved! Please try again."
    #    render 'static_pages/home'
    # end
    
  end

  def destroy
  end

  def index
  end

  def edit
    
  end

  private
    def behavior_params
      params.require(:behavior).permit(:pos1, :neg1, :neg2, :cor1)
    end
end
