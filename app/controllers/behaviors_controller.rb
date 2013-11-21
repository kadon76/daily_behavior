class BehaviorsController < ApplicationController
  def new
    @student = Student.find_by(id: session[:this_student_id])
  	@behavior = Behavior.new(pos1_name: "Positive", neg1_name: "Negative1", 
                            neg2_name: "Negative2", cor1_name: "Correction")
    @today = Time.now
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
      params.require(:behavior).permit(:pos1, :neg1, :neg2, :cor1, 
                    :pos1_name, :neg1_name, :neg2_name, :cor1_name, :record_time)
    end
end
