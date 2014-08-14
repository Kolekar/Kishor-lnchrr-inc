class MessagesController < ApplicationController
  layout :false
  before_filter :authenticate_user!

  def index
    @users = User.where("id != ?", current_user.id)
  end

  def join_team
    Notification.join_team(post, params[:message], current_user).deliver
    redirect_to( post.redirect_url.present? ? post.redirect_url : post_path(post) )
  end

  private

  def post
    @psot ||= Post.find(params[:post_id])
  end
end
