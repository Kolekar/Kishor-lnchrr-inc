class Api::Ajax::ChatFilterAjaxController < ApplicationController
	layout false
	skip_before_filter :verify_authenticity_token
	def create
		
			@users=User.where("email like '%#{params[:filterword]}%'")
			@users -= [current_user]
	end
end
