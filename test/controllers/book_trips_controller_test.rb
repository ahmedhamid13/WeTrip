require 'test_helper'

class BookTripsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book_trip = book_trips(:one)
  end

  test "should get index" do
    get book_trips_url
    assert_response :success
  end

  test "should get new" do
    get new_book_trip_url
    assert_response :success
  end

  test "should create book_trip" do
    assert_difference('BookTrip.count') do
      post book_trips_url, params: { book_trip: { adults: @book_trip.adults, children: @book_trip.children, is_paid: @book_trip.is_paid, total_price: @book_trip.total_price, trip_id: @book_trip.trip_id, user_id: @book_trip.user_id } }
    end

    assert_redirected_to book_trip_url(BookTrip.last)
  end

  test "should show book_trip" do
    get book_trip_url(@book_trip)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_trip_url(@book_trip)
    assert_response :success
  end

  test "should update book_trip" do
    patch book_trip_url(@book_trip), params: { book_trip: { adults: @book_trip.adults, children: @book_trip.children, is_paid: @book_trip.is_paid, total_price: @book_trip.total_price, trip_id: @book_trip.trip_id, user_id: @book_trip.user_id } }
    assert_redirected_to book_trip_url(@book_trip)
  end

  test "should destroy book_trip" do
    assert_difference('BookTrip.count', -1) do
      delete book_trip_url(@book_trip)
    end

    assert_redirected_to book_trips_url
  end
end
