class SearchController < ApplicationController

	def index
		if (params[:search])
			@schools = School.all
			@schools = @schools.select { |school| school.distance_to(params[:search]) != nil && school.distance_to(params[:search]) < 3}
		else
			@schools = School.none
		end
	end

	def show
		@school = School.find(params[:id])
		if (params[:search])
			@schools = School.all
			@schools = @schools.select { |school| school.distance_to(params[:search]) != nil && school.distance_to(params[:search]) < 3}
		else
			@schools = School.none
		end
		render 'index'
	end
	
end
