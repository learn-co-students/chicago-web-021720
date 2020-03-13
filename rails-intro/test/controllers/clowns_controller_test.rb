require 'test_helper'

class ClownsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @clown = clowns(:one)
  end

  test "should get index" do
    get clowns_url
    assert_response :success
  end

  test "should get new" do
    get new_clown_url
    assert_response :success
  end

  test "should create clown" do
    assert_difference('Clown.count') do
      post clowns_url, params: { clown: { age: @clown.age, is_cool: @clown.is_cool, name: @clown.name, phrase: @clown.phrase } }
    end

    assert_redirected_to clown_url(Clown.last)
  end

  test "should show clown" do
    get clown_url(@clown)
    assert_response :success
  end

  test "should get edit" do
    get edit_clown_url(@clown)
    assert_response :success
  end

  test "should update clown" do
    patch clown_url(@clown), params: { clown: { age: @clown.age, is_cool: @clown.is_cool, name: @clown.name, phrase: @clown.phrase } }
    assert_redirected_to clown_url(@clown)
  end

  test "should destroy clown" do
    assert_difference('Clown.count', -1) do
      delete clown_url(@clown)
    end

    assert_redirected_to clowns_url
  end
end
