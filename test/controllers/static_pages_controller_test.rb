require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    # Change the local server address 
    Rails.application.routes.default_url_options[:host]= 'localhost:3000'
  end

  test "stub watir test" do
    browser = Watir::Browser.new
    browser.goto static_pages_home_url
    # browser.text_field(name: "first").set "Jarmo"
    # browser.text_field(name: "last").set  "Pertman"
  end

end
