require 'test_helper'

class SurveyTest < ActiveSupport::TestCase

  test "should_not_save_empty_survey" do
    survey = Survey.new
	assert_not survey.save
  end
  
  test "should_not_save_survey_empty_MoA" do
    survey = Survey.new
	survey.at_no_time_responses = 5
	survey.few_times_responses = 5
	survey.some_times_responses = 5
	assert_not survey.save
  end
  
  test "should_not_save_survey_empty_ANT" do
    survey = Survey.new
	survey.many_or_all_responses = 5
	survey.few_times_responses = 5
	survey.some_times_responses = 5
	assert_not survey.save
  end
  
  test "should_not_save_survey_empty_FT" do
    survey = Survey.new
	survey.many_or_all_responses = 5
	survey.at_no_time_responses = 5
	survey.some_times_responses = 5
	assert_not survey.save
  end
  
  test "should_not_save_survey_empty_ST" do
    survey = Survey.new
	survey.many_or_all_responses = 5
	survey.at_no_time_responses = 5
	survey.few_times_responses = 5
	assert_not survey.save
  end
  
  test "should_save_survey_complete" do
    survey = Survey.new
	survey.many_or_all_responses = 5
	survey.at_no_time_responses = 5
	survey.few_times_responses = 5
	survey.some_times_responses = 5
	assert survey.save
  end
  
end
