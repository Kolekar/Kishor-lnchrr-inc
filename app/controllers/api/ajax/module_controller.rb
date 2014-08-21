class Api::Ajax::ModuleController < ApplicationController
	layout false
	skip_before_filter :verify_authenticity_token
end