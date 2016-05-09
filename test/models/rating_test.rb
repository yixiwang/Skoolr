require 'test_helper'

class RatingTest < ActiveSupport::TestCase

  test "should_not_save_empty_rating" do
    rating = Rating.new
	assert_not rating.save
  end
  
  test "should_not_save_rating_invalid" do
	rating = Rating.new
	rating.value = -5
	assert_not rating.save
  end
  
  test "should_save_rating_complete" do
    rating = Rating.new
	rating.value = 4
	assert rating.save
  end
  
end
