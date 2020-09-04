require 'test_helper'

class StopSmokingInfosControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get stop_smoking_infos_create_url
    assert_response :success
  end

end
