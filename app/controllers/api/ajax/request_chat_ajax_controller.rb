class Api::Ajax::RequestChatAjaxController < ApplicationController
	layout false
	skip_before_filter :verify_authenticity_token
	def create
		@user=User.find(params[:id])
		@messages=current_user.messages.where(:received_messageable_id=>@user.id)
		@messages+=@user.messages.where(:received_messageable_id=>current_user.id)
		@messages.sort_by { |k| k[:created_at] }
		puts @messages.to_json
	end
	def refresh_unreadMessages_ajax
		user=User.find(params[:id])
		@messages=current_user.messages.are_from(user).are_to(current_user).unreaded
		ActiveRecord::Base.connection.execute("UPDATE messages set opened= true where id in (#{@messages.collect(&:id).join(', ')}) ") if @messages.length>0
	end
end
