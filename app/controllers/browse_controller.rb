class BrowseController < ApplicationController

	def index
		@schools = School.all
		if (params[:search])
			@schools = School.search(params[:search])
		else
			@schools = School.all
		end
	end

	def show
		@school = School.find(params[:id])
		@survey = @school.survey
		if (params[:search])
			@schools = School.search(params[:search])
		else
			@schools = School.all
		end
		render 'index'
	end
	

end
