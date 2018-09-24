require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  
  def setup
    @location = locations(:seattle)
  end
  
  test "should be valid" do
    assert @location.valid?
  end
  
  test "city should be present" do
    @location.city = ""
    assert_not @location.valid?
  end
  
  test "state should be present" do
    @location.state = ""
    assert_not @location.valid?
  end
  
end
