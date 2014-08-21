class Api::Ajax::ChatFilterAjaxController < Api::Ajax::ModuleController
	def create
		@users=User.where("email like '%#{params[:filterword]}%'")
		@users -= [current_user]
	end
end
