require 'test_helper'

class WeatherForecastTest < ActionDispatch::IntegrationTest
  
  def setup
    @location = locations(:seattle)
  end
  
  test "invalid location information" do
    assert_no_difference 'Location.count' do
      post index_path, params: { city: "", state: "" }
    end
  end
  
  test "valid location information" do
    city = "Charlotte"
    state = "NC"
    assert_difference 'Location.count' do
      post index_path, params: { city: city, state: state }
    end
    # Check that new location is in Previous Searches
    assert_match city,  response.body
    assert_match state, response.body
    
    # Location already exists, so the count should not change
    assert_no_difference 'Location.count' do
      post index_path, params: { city: @location.city, state: @location.state }
    end
    # Check that location is in Previous Searches
    assert_match @location.city,  response.body
    assert_match @location.state, response.body
  end
  
end
