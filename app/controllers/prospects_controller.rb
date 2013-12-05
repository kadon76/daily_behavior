class ProspectsController < ApplicationController
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

private

  	def prospect_params
  		params.require(:prospect).permit(:name, :email)
  	end

end
