class PagesController < ApplicationController


	def home
	end
	
	def search
	end
	
	def browse
		@schools = School.all
	end
	
	def login
	end
	
	def admin
	end

	def profile
		@favorites = current_user.favorites
	end

	def socialmedia

	end

end
