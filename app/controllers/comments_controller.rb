class CommentsController < ApplicationController

	def create 
   
		@comment = Comment.new(comment_params)
    @post=@comment.post 
    @comment.save
    redirect_to post_path(@post)
	end 

  def new 
   end

	def destroy 
   
		@comment =Comment.find(params[:id])
    @post=@comment.post 
   
  	if @comment.destroy 
  		flash[:notice] = "Comment deleted"
       redirect_to post_path(@post)
  	else 
  		flash[:alert] = "Error in deleting"
      redirect_to home_path
  	end
     
	end 

  def edit 
    @comment = Comment.find(comment_params)
    @post=@comment.post 
  end 

  def update 
    @comment = Comment.find(comment_params)
    @post=@comment.post
    @comment.update(comment_params)
    if @comment.save
      flash[:notice] = "Comment updated"
    else 
      flash[:alert] = "Error in updating"
    end 
    redirect_to post_path(@post)
  end 

private
    def comment_params
      params.require(:comment).permit(:user_id, :post_id, :body)
    end
end
