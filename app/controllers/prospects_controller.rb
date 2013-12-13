class ProspectsController < ApplicationController
  before_action :signed_in_user,  only: :index
  before_action :admin_user,      only: :index
  def new
  	@prospect = Prospect.new
  end

  def create
  	@prospect = Prospect.new(prospect_params)		
  	if @prospect.save
     	flash[:success] = "You have been added to our mailing list!"
  		redirect_to root_url
  	else
  		flash.now[:warning] = "You have already signed up to receive more information. 
  							Thank you for your continued interest!"
  		render 'new'
  	end
  end

  def index
    @prospects = Prospect.paginate(page: params[:page])
  end

private

  	def prospect_params
  		params.require(:prospect).permit(:name, :email)
  	end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
