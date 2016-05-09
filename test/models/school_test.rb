require 'test_helper'

class SchoolTest < ActiveSupport::TestCase

  test "should_not_save_empty_school" do
    school = School.new
	assert_not school.save
  end
  
  test "should_not_save_school_empty_name" do
    school = School.new
	school.address = "school address"
	assert_not school.save
  end
  
  test "should_not_save_school_empty_address" do
    school = School.new
	school.name = "school name"
	assert_not school.save
  end
  
  test "should_save_school_complete" do
    school = School.new
	school.name = "school name"
	school.address = "school address"
	assert school.save
  end
  
end
