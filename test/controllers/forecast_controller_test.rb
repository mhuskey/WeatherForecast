require 'test_helper'

class ForecastControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @base_title = "WeatherForecast App"
  end
  
  test "should get index" do
    get root_path
    assert_response :success
    assert_select "title", "Home" + " | #{@base_title}"
  end
  
end
