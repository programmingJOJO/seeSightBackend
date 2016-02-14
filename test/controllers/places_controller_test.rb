require 'test_helper'

class PlacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @place = places(:one)
  end

  test "should get index" do
    get places_url
    assert_response :success
  end

  test "should create place" do
    assert_difference('Place.count') do
      post places_url, params: { place: { description: @place.description, name: @place.name } }
    end

    assert_response 201
  end

  test "should show place" do
    get place_url(@place)
    assert_response :success
  end

  test "should update place" do
    patch place_url(@place), params: { place: { description: @place.description, name: @place.name } }
    assert_response 200
  end

  test "should destroy place" do
    assert_difference('Place.count', -1) do
      delete place_url(@place)
    end

    assert_response 204
  end
end
