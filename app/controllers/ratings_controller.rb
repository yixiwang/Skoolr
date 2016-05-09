class RatingsController < ApplicationController

	def create
		@school = School.find(params[:school_id]);
		if user_rated?(@school)
			get_rating(@school).destroy
		end
		@rating = @school.ratings.create(rating_params)
		redirect_to :back
	end
	
	private
	def rating_params
		params.require(:rating).permit(:user, :value)
	end
	
	helper
	def user_rated?(school)
		school.ratings.each do |rating|
			if rating.user == current_user.id
				return true
			end
		end
		return false
	end
	
	helper
	def get_rating(school)
		school.ratings.each do |rating|
			if rating.user == current_user.id
				return rating
			end
		end
		return nil
	end
	

end
