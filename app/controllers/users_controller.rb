class UsersController < ApplicationController

  before_action :signed_in_user
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: [:destroy, :new, :create]
  
  def index
    @users = User.paginate(page: params[:page])
  end

  def show
  	@user = User.find(params[:id])
    @students = @user.students.paginate(page: params[:page])
  end

  def edit
   
  end

  def update
   
    if @user.update_attributes(user_params)
      # Handle a successfuol update.
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)		
  	if @user.save
      sign_in @user
  		flash[:success] = "Welcome to the Sample App!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def destroy
    @user = User.find(params[:id])
    if current_user?(@user)
      flash[:error] = "You cannot delete yourself!"
      redirect_to users_url
    else
      @user.destroy
      flash[:success] = "User deleted."
      redirect_to users_url
    end
  end

  private

  	def user_params
  		params.require(:user).permit(:name, :email, :password, 
  									:password_confirmation)
  	end

    # Before filters

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)      
    end

    def admin_user
      redirect_to(root_url) unless  current_user.admin?
    end


end
