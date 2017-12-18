require 'test_helper'

class ApiTokenControllerTest < ActionDispatch::IntegrationTest

	def setup
    @user = users(:michael)
    @other_user = users(:inactive)
    
  end


test "should send api token to registred and logged user" do
    log_in_as(@user)
    get api_token_path
    assert_not flash.empty?
    assert_redirected_to root_url
    assert_equal 1, ActionMailer::Base.deliveries.size
  end

test "should not send api token to unregistred user" do
    get api_token_path
    assert_not flash.empty?
    assert_redirected_to root_url
    assert_equal 0, ActionMailer::Base.deliveries.size
  end

test "should not send api token to registred user and inactive user" do
	log_in_as(@other_user)
    get api_token_path
    assert_not flash.empty?
    assert_redirected_to root_url
    assert_equal 0, ActionMailer::Base.deliveries.size
  end



end