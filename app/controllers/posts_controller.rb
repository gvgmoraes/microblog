class PostsController < ApplicationController
  def index
	  @posts = Post.all 
   
  end

  def new 
  	@post = Post.new
  	# @current_user = User.find_by_id(session[:current_user_id])
  end 

  def show
     if current_user == nil 
      flash[:alert] = "Sign in/Log in to access that!"
      redirect_to root_path 
    else 
  	 @post = Post.find(params[:id])
  	 @user = @post.user
  	 @comment = @post.comments
    end 
  end

  def create
    
  	@post = Post.new(post_params)
  	if @post.save
  		redirect_to @post
  	else
  		redirect_to back
  	end
  end 

  def update 
	   @post = Post.find(params[:id])
     
	   @post.update(post_params)
	   if @post.save
      flash[:notice] = "Post updated"
    else 
      flash[:alert] = "Error in creating"
    end 
    redirect_to @post
end 

 def edit 
  	@post = Post.find(params[:id])
  end 
  
  def destroy
  	@post =Post.find(params[:id])
    if @post.user_id == current_user.id
    	if @post.destroy 
    		flash[:notice] = "Post deleted"
    		redirect_to '/posts'
    	else 
    		flash[:alert] = "Error in deleting"
    		redirect_to @post
    	end
    else 
      flash[:alert] = "You're not the owner of this post"
    end 
  end 

  private
    def post_params
      params.require(:post).permit(:hipster, :user_id)
    end

end

  







 

 
