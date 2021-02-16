require 'test_helper'

class GroupEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group_event = group_events(:one)
  end

  test "should get index" do
    get group_events_url
    assert_response :success
  end

  test "should get new" do
    get new_group_event_url
    assert_response :success
  end

  test "should create group_event" do
    assert_difference('GroupEvent.count') do
      post group_events_url, params: { group_event: { deleted: @group_event.deleted, description: @group_event.description, event_days: @group_event.event_days, event_name: @group_event.event_name, location: @group_event.location, published: @group_event.published, status: @group_event.status, user_id: @group_event.user_id } }
    end

    assert_redirected_to group_event_url(GroupEvent.last)
  end

  test "should show group_event" do
    get group_event_url(@group_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_group_event_url(@group_event)
    assert_response :success
  end

  test "should update group_event" do
    patch group_event_url(@group_event), params: { group_event: { deleted: @group_event.deleted, description: @group_event.description, event_days: @group_event.event_days, event_name: @group_event.event_name, location: @group_event.location, published: @group_event.published, status: @group_event.status, user_id: @group_event.user_id } }
    assert_redirected_to group_event_url(@group_event)
  end

  test "should destroy group_event" do
    assert_difference('GroupEvent.count', -1) do
      delete group_event_url(@group_event)
    end

    assert_redirected_to group_events_url
  end
end
