require 'test_helper'

class EventAttendeeGroupControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get event_attendee_group_index_url
    assert_response :success
  end

end
