class SessionsController < ApplicationController

	def create 
	@user = User.where(email: params[:email]).first
	
	
		if @user && @user.password == params[:password]
			session[:user_id] = @user.id
			flash[:notice] = "Sign in sucessful"
			redirect_to users_path 
		else 
			flash[:alert]="Email and password do not match"
			redirect_to root_path
		end 
	
	# redirect_to '/sessions/new'
	
	# session[:current_user_id] = @user.id
	end 


	def destroy 
		session[:user_id] = nil
		flash[:notice] ="Signout sucessful"
		redirect_to root_path
	end 

	def new 

	end
end
