class CommentsController < ApplicationController
 def index
	  
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    
    respond_to do |format|
      format.html # show.html.erb
      format.js
    end
end


  
def create
    @post = Post.find(params[:post_id])
     flash[:notice] = "Thanks for comment"

    @comment = @post.comments.create(params[:comment])
    respond_to do |format|
     format.html { redirect_to post_path(@post)}
     format.js
     end

  end


def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:comment_id])
    @comment.destroy
   respond_to do |format|
      format.html 

      format.js
    end
end
end
