require 'test_helper'

class EventTimeMonitoringsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_time_monitoring = event_time_monitorings(:one)
  end

  test "should get index" do
    get event_time_monitorings_url
    assert_response :success
  end

  test "should get new" do
    get new_event_time_monitoring_url
    assert_response :success
  end

  test "should create event_time_monitoring" do
    assert_difference('EventTimeMonitoring.count') do
      post event_time_monitorings_url, params: { event_time_monitoring: { event_duration: @event_time_monitoring.event_duration, event_end_time: @event_time_monitoring.event_end_time, event_start_time: @event_time_monitoring.event_start_time, group_events_id: @event_time_monitoring.group_events_id } }
    end

    assert_redirected_to event_time_monitoring_url(EventTimeMonitoring.last)
  end

  test "should show event_time_monitoring" do
    get event_time_monitoring_url(@event_time_monitoring)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_time_monitoring_url(@event_time_monitoring)
    assert_response :success
  end

  test "should update event_time_monitoring" do
    patch event_time_monitoring_url(@event_time_monitoring), params: { event_time_monitoring: { event_duration: @event_time_monitoring.event_duration, event_end_time: @event_time_monitoring.event_end_time, event_start_time: @event_time_monitoring.event_start_time, group_events_id: @event_time_monitoring.group_events_id } }
    assert_redirected_to event_time_monitoring_url(@event_time_monitoring)
  end

  test "should destroy event_time_monitoring" do
    assert_difference('EventTimeMonitoring.count', -1) do
      delete event_time_monitoring_url(@event_time_monitoring)
    end

    assert_redirected_to event_time_monitorings_url
  end
end
