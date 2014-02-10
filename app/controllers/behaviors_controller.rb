class BehaviorsController < ApplicationController
  before_action :signed_in_user

  def new
    @student = Student.find_by(id: session[:this_student_id])
  	@behavior = Behavior.new
    @today = Time.now
    @behavior.pos1 = 1
    @behavior.pos2 = 1
    @behavior.pos3 = 1
    @behavior.pos4 = 1
  end

  def create
    @student = Student.find_by(id: session[:this_student_id])
    respond_to do |format|
      format.js {
        @behaviors = params[:behaviors].values
        @behaviors.each do |behavior_params|
          @behavior = @student.behaviors.create(behavior_params)
        end
      }
      format.html{
        @behavior = @student.behaviors.create(behavior_params)
        redirect_to @student
      }
    end
    
    

        
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

  def new_single_today
    respond_to do |format|
      format.js {
        @student = Student.find_by(id: session[:this_student_id])
        @behavior = Behavior.new
        @today = Time.now
        @behavior.pos1 = 1
        @behavior.pos2 = 1
        @behavior.pos3 = 1
        @behavior.pos4 = 1
      }
    end
  end

  def new_whole_day
    respond_to do |format|
      format.js {
        @student = Student.find_by(id: session[:this_student_id])
        @behavior = Behavior.new
        @today = Time.now
      }
    end
  end

  def new_single_choose
    respond_to do |format|
      format.js {
        @student = Student.find_by(id: session[:this_student_id])
        @behavior = Behavior.new
        @today = Time.now
        @behavior.pos1 = 1
        @behavior.pos2 = 1
        @behavior.pos3 = 1
        @behavior.pos4 = 1
      }
    end
  end

  def destroy
      @student = Student.find_by(id: session[:this_student_id])
      @behavior = @student.behaviors.find(params[:id])
      if @behavior.destroy
        flash[:success] = "Behavior deleted."
        redirect_to @student
      else
        flash![:error] = "Behavior NOT deleted."
      end
      
    end

  def index
  end

  def edit
    @behavior = Behavior.find(params[:id])
  end

  def show
    @behavior = Behavior.find(params[:id])
  end

  def update
    @student = Student.find_by(id: session[:this_student_id])
    @behavior = Behavior.find(params[:id])
    if @behavior.update_attributes(behavior_params)
      # Handle a successfuol update.
      flash[:success] = "Behavior updated"
      redirect_to @student
    else
      flash![:error] = "Something went wrong!"
      render 'edit'
    end
  end

  private
    def behavior_params
      params.require(:behavior).permit(:pos1, :pos2, :pos3, :pos4, :neg1, :neg2, :neg3, :neg4, 
                :neg5, :neg6, :neg7, :neg8, :neg9, :neg10, :neg11, :neg12, 
                :neg13, :neg14, :neg15, :neg16, :cor1, :cor2, :cor3, :cor4, :record_time)
    end
end
