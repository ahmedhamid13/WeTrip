require "application_system_test_case"

class BookTripsTest < ApplicationSystemTestCase
  setup do
    @book_trip = book_trips(:one)
  end

  test "visiting the index" do
    visit book_trips_url
    assert_selector "h1", text: "Book Trips"
  end

  test "creating a Book trip" do
    visit book_trips_url
    click_on "New Book Trip"

    fill_in "Adults", with: @book_trip.adults
    fill_in "Children", with: @book_trip.children
    check "Is paid" if @book_trip.is_paid
    fill_in "Total price", with: @book_trip.total_price
    fill_in "Trip", with: @book_trip.trip_id
    fill_in "User", with: @book_trip.user_id
    click_on "Create Book trip"

    assert_text "Book trip was successfully created"
    click_on "Back"
  end

  test "updating a Book trip" do
    visit book_trips_url
    click_on "Edit", match: :first

    fill_in "Adults", with: @book_trip.adults
    fill_in "Children", with: @book_trip.children
    check "Is paid" if @book_trip.is_paid
    fill_in "Total price", with: @book_trip.total_price
    fill_in "Trip", with: @book_trip.trip_id
    fill_in "User", with: @book_trip.user_id
    click_on "Update Book trip"

    assert_text "Book trip was successfully updated"
    click_on "Back"
  end

  test "destroying a Book trip" do
    visit book_trips_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Book trip was successfully destroyed"
  end
end
