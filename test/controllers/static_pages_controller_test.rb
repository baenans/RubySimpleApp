require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    # Change the local server address 
    Rails.application.routes.default_url_options[:host]= 'localhost:3000'
  end

  test "stub watir test" do
    browser = Watir::Browser.new
    browser.goto static_pages_home_url
    browser.close
  end

  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
  end

end
