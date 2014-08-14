class Api::Ajax::ChatRemoveAjaxController < Ajax::ModuleController
	def create
		Message.find(params[:id]).destroy
	end
end
