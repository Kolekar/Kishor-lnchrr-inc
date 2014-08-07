class Httpapi::V1::ChangeSwitchController < ApplicationController
	
	def index

		@model=params[:model].constantize.find(params[:id])
		value=@model.send(params[:attribute])
		if @model.update_attributes(params[:attribute] => !value)
			attribute_value= !value
		else
			attribute_value= value
		end
		render :json => {:success => true, :attribute_value=>attribute_value}and return
		
	end 

end
