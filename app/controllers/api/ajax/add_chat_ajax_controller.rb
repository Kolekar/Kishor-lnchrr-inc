class Api::Ajax::AddChatAjaxController < ApplicationController
	layout :false
	skip_before_filter :verify_authenticity_token
	def create
		@user=User.find(params[:id])
		current_user.send_message(@user, params[:message], params[:message])
		@messages=current_user.messages.where(:received_messageable_id=>@user.id)
		@messages+=@user.messages.where(:received_messageable_id=>current_user.id)
		@messages.sort_by { |k| k[:created_at] }
	end
end
