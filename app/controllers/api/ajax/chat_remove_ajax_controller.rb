class Api::Ajax::ChatRemoveAjaxController < ApplicationController
	layout false
	skip_before_filter :verify_authenticity_token
	def create
		Message.find(params[:id]).destroy

	end
end
