require "test_helper"

class DataDeletionControllerTest < ActionDispatch::IntegrationTest
  test "should get facebook_deletion" do
    get data_deletion_facebook_deletion_url
    assert_response :success
  end
end
