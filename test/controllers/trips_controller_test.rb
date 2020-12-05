require 'test_helper'

class TripsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trip = trips(:one)
  end

  test "should get index" do
    get trips_url
    assert_response :success
  end

  test "should get new" do
    get new_trip_url
    assert_response :success
  end

  test "should create trip" do
    assert_difference('Trip.count') do
      post trips_url, params: { trip: { adult_price: @trip.adult_price, ar_description: @trip.ar_description, ar_leaving_place: @trip.ar_leaving_place, ar_name: @trip.ar_name, available_places: @trip.available_places, child_price: @trip.child_price, currency: @trip.currency, destination_id: @trip.destination_id, en_description: @trip.en_description, en_leaving_place: @trip.en_leaving_place, en_name: @trip.en_name, leaving_time: @trip.leaving_time, returning_time: @trip.returning_time } }
    end

    assert_redirected_to trip_url(Trip.last)
  end

  test "should show trip" do
    get trip_url(@trip)
    assert_response :success
  end

  test "should get edit" do
    get edit_trip_url(@trip)
    assert_response :success
  end

  test "should update trip" do
    patch trip_url(@trip), params: { trip: { adult_price: @trip.adult_price, ar_description: @trip.ar_description, ar_leaving_place: @trip.ar_leaving_place, ar_name: @trip.ar_name, available_places: @trip.available_places, child_price: @trip.child_price, currency: @trip.currency, destination_id: @trip.destination_id, en_description: @trip.en_description, en_leaving_place: @trip.en_leaving_place, en_name: @trip.en_name, leaving_time: @trip.leaving_time, returning_time: @trip.returning_time } }
    assert_redirected_to trip_url(@trip)
  end

  test "should destroy trip" do
    assert_difference('Trip.count', -1) do
      delete trip_url(@trip)
    end

    assert_redirected_to trips_url
  end
end
