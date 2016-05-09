require 'test_helper'

class GradeTest < ActiveSupport::TestCase

  test "should_not_save_empty_grade" do
    grade = Grade.new
	assert_not grade.save
  end
  
  test "should_not_save_grade_empty_subject" do
    grade = Grade.new
	grade.average_mark = 100
	assert_not grade.save
  end
  
  test "should_not_save_grade_empty_mark" do
    grade = Grade.new
	grade.subject = "grade subject"
	assert_not grade.save
  end
  
  test "should_save_grade_complete" do
    grade = Grade.new
	grade.subject = "grade subject"
	grade.average_mark = 100
	assert grade.save
  end
  
end
