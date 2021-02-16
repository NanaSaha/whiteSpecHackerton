require "application_system_test_case"

class EventTimeMonitoringsTest < ApplicationSystemTestCase
  setup do
    @event_time_monitoring = event_time_monitorings(:one)
  end

  test "visiting the index" do
    visit event_time_monitorings_url
    assert_selector "h1", text: "Event Time Monitorings"
  end

  test "creating a Event time monitoring" do
    visit event_time_monitorings_url
    click_on "New Event Time Monitoring"

    fill_in "Event duration", with: @event_time_monitoring.event_duration
    fill_in "Event end time", with: @event_time_monitoring.event_end_time
    fill_in "Event start time", with: @event_time_monitoring.event_start_time
    fill_in "Group events", with: @event_time_monitoring.group_events_id
    click_on "Create Event time monitoring"

    assert_text "Event time monitoring was successfully created"
    click_on "Back"
  end

  test "updating a Event time monitoring" do
    visit event_time_monitorings_url
    click_on "Edit", match: :first

    fill_in "Event duration", with: @event_time_monitoring.event_duration
    fill_in "Event end time", with: @event_time_monitoring.event_end_time
    fill_in "Event start time", with: @event_time_monitoring.event_start_time
    fill_in "Group events", with: @event_time_monitoring.group_events_id
    click_on "Update Event time monitoring"

    assert_text "Event time monitoring was successfully updated"
    click_on "Back"
  end

  test "destroying a Event time monitoring" do
    visit event_time_monitorings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event time monitoring was successfully destroyed"
  end
end
