require "application_system_test_case"

class SchedulesTest < ApplicationSystemTestCase
  setup do
    @schedule = schedules(:one)
  end

  test "visiting the index" do
    visit schedules_url
    assert_selector "h1", text: "Schedules"
  end

  test "creating a Schedule" do
    visit schedules_url
    click_on "New Schedule"

    fill_in "Ar name", with: @schedule.ar_name
    fill_in "Day", with: @schedule.day_id
    fill_in "En name", with: @schedule.en_name
    fill_in "Time", with: @schedule.time
    click_on "Create Schedule"

    assert_text "Schedule was successfully created"
    click_on "Back"
  end

  test "updating a Schedule" do
    visit schedules_url
    click_on "Edit", match: :first

    fill_in "Ar name", with: @schedule.ar_name
    fill_in "Day", with: @schedule.day_id
    fill_in "En name", with: @schedule.en_name
    fill_in "Time", with: @schedule.time
    click_on "Update Schedule"

    assert_text "Schedule was successfully updated"
    click_on "Back"
  end

  test "destroying a Schedule" do
    visit schedules_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Schedule was successfully destroyed"
  end
end
