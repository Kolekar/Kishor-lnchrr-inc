class Api::Ajax::ChatRemoveAjaxController < Api::Ajax::ModuleController
	def create
		Message.find(params[:id]).destroy
	end
end
