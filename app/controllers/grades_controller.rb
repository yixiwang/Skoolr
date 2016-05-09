class GradesController < ApplicationController

  def create
    @school = School.find(params[:school_id])
    @grade = @school.grades.create(grade_params)
	
	if @grade.save
		redirect_to school_path(@school)
	else
		render 'schools/edit'
	end
	
  end
  
  def destroy
    @school = School.find(params[:school_id])
    @grade = @school.grades.find(params[:id])
    @grade.destroy
    redirect_to school_path(@school)
  end

  def import
    Grade.import
    redirect_to :back
  end
 
  private
    def grade_params
      params.require(:grade).permit(:subject, :average_mark)
    end
end
