require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get jobs" do
    get :jobs
    assert_response :success
  end

  test "should get press" do
    get :press
    assert_response :success
  end

  test "should get help" do
    get :help
    assert_response :success
  end

  test "should get policies" do
    get :policies
    assert_response :success
  end

  test "should get terms" do
    get :terms
    assert_response :success
  end

  test "should get privacy" do
    get :privacy
    assert_response :success
  end

  test "should get trustsafety" do
    get :trustsafety
    assert_response :success
  end

  test "should get invitefriends" do
    get :invitefriends
    assert_response :success
  end

  test "should get projectswelove" do
    get :projectswelove
    assert_response :success
  end

  test "should get mobile" do
    get :mobile
    assert_response :success
  end

  test "should get supportcreativity" do
    get :supportcreativity
    assert_response :success
  end

  test "should get sitemap" do
    get :sitemap
    assert_response :success
  end

  test "should get prepareproject" do
    get :prepareproject
    assert_response :success
  end

  test "should get protectingyouridea" do
    get :protectingyouridea
    assert_response :success
  end

  test "should get projectguidelines" do
    get :projectguidelines
    assert_response :success
  end

  test "should get stories" do
    get :stories
    assert_response :success
  end

  test "should get joiningteams" do
    get :joiningteams
    assert_response :success
  end

end
