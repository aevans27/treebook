require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:allan).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end

  test "should render a 404 on profiles not found" do
  	get :show, id: "doesn't exist"
  	assert_response :not_found
  end

  test "that variables are assigned on successfule profile viewing" do
  	get :show, id: users(:allan).profile_name
  	assert assigns(:user)
  	assert_not_empty assigns(:statuses)
  end
  
  test "shows only correct user on statuses" do
  	get :show, id: users(:allan).profile_name
  	assigns(:statuses).each do |status|
  		assert_equal users(:allan), status.user
  end
end

end
