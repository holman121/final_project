require 'test_helper'

class ClothingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get clothings_index_url
    assert_response :success
  end

  test "should get show" do
    get clothings_show_url
    assert_response :success
  end

end
