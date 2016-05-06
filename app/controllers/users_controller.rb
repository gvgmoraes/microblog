class UsersController < ApplicationController
  def index
      @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Your account was created
      successfully."
      redirect_to user_path @user
    else
      flash[:alert] = "There was a problem saving your
      account."
      redirect_to new_user_path
    end 
  end

  def new

  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
      @user.update(user_params)
      if @user.save
        flash[:notice] = "User updated"
      redirect_to @user
    else  
      flash[:alert] = "Error in updating"
      redirect_to user_update_path
    end 
  end

  def show
    if current_user == nil 
      flash[:alert] = "Sign in/Log in to access that!"
      redirect_to root_path 
    else 
      @user = User.find(params[:id])
      @posts = @user.posts
    end
  end


  def destroy
    @user =User.find(params[:id])
    # @posts=@user.posts 
    # @comments=@
    if @user.destroy 
      session.clear 
      flash[:notice] = "User deleted"
      redirect_to '/users'
    else 
      flash[:alert] = "Error in deleting"
      redirect_to @user
    end
  end

private
 def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end 
