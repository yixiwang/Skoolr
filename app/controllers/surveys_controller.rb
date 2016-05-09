class SurveysController < ApplicationController
  def create
    @school = School.find(params[:school_id])
	@survey = @school.survey.create(survey_params)
	
	if @survey.save
		redirect_to school_path(@school)
	else
		render 'schools/edit'
	end
  end
  
  def update
	@survey = Survey.find(params[:id])
	if @survey.update(survey_params)
		redirect_to school_path(@survey.school)
	else
		render 'schools/edit'
	end
  end
  
  def destroy
    @school = School.find(params[:school_id])
    @survey = @school.surveys.find(params[:id])
    @survey.destroy
    redirect_to school_path(@school)
  end

  def import
    Survey.import
    redirect_to schools_path
  end
  
  private
    def survey_params
	  params.require(:survey).permit(:many_or_all_responses, :at_no_time_responses, :few_times_responses, :some_times_responses)
    end
end