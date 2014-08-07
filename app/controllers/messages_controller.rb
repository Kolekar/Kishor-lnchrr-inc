class MessagesController < ApplicationController
	layout :false
	before_filter :authenticate_user!
  def index
  @users=User.all
   @users -= [current_user]
  end

  def join_team
  	@post=Post.find(params[:post_id])
  	Notification.join_team(@post, params[:message], current_user).deliver	
  	redirect_to"/posts/#{@post.id}"
  end
end
