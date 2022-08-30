require 'test_helper'

class KintaipagesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get kintaipages_top_url
    assert_response :success
  end

end
