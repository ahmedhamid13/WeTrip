require "application_system_test_case"

class TripsTest < ApplicationSystemTestCase
  setup do
    @trip = trips(:one)
  end

  test "visiting the index" do
    visit trips_url
    assert_selector "h1", text: "Trips"
  end

  test "creating a Trip" do
    visit trips_url
    click_on "New Trip"

    fill_in "Adult price", with: @trip.adult_price
    fill_in "Ar description", with: @trip.ar_description
    fill_in "Ar leaving place", with: @trip.ar_leaving_place
    fill_in "Ar name", with: @trip.ar_name
    fill_in "Available places", with: @trip.available_places
    fill_in "Child price", with: @trip.child_price
    fill_in "Currency", with: @trip.currency
    fill_in "Destination", with: @trip.destination_id
    fill_in "En description", with: @trip.en_description
    fill_in "En leaving place", with: @trip.en_leaving_place
    fill_in "En name", with: @trip.en_name
    fill_in "Leaving time", with: @trip.leaving_time
    fill_in "Returning time", with: @trip.returning_time
    click_on "Create Trip"

    assert_text "Trip was successfully created"
    click_on "Back"
  end

  test "updating a Trip" do
    visit trips_url
    click_on "Edit", match: :first

    fill_in "Adult price", with: @trip.adult_price
    fill_in "Ar description", with: @trip.ar_description
    fill_in "Ar leaving place", with: @trip.ar_leaving_place
    fill_in "Ar name", with: @trip.ar_name
    fill_in "Available places", with: @trip.available_places
    fill_in "Child price", with: @trip.child_price
    fill_in "Currency", with: @trip.currency
    fill_in "Destination", with: @trip.destination_id
    fill_in "En description", with: @trip.en_description
    fill_in "En leaving place", with: @trip.en_leaving_place
    fill_in "En name", with: @trip.en_name
    fill_in "Leaving time", with: @trip.leaving_time
    fill_in "Returning time", with: @trip.returning_time
    click_on "Update Trip"

    assert_text "Trip was successfully updated"
    click_on "Back"
  end

  test "destroying a Trip" do
    visit trips_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Trip was successfully destroyed"
  end
end
