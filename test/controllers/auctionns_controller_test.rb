require 'test_helper'

class AuctionnsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auctionn = auctionns(:one)
  end

  test "should get index" do
    get auctionns_url
    assert_response :success
  end

  test "should get new" do
    get new_auctionn_url
    assert_response :success
  end

  test "should create auctionn" do
    assert_difference('Auctionn.count') do
      post auctionns_url, params: { auctionn: { actual: @auctionn.actual, fecha: @auctionn.fecha, minimo: @auctionn.minimo, participantes: @auctionn.participantes, precio: @auctionn.precio, puja: @auctionn.puja } }
    end

    assert_redirected_to auctionn_url(Auctionn.last)
  end

  test "should show auctionn" do
    get auctionn_url(@auctionn)
    assert_response :success
  end

  test "should get edit" do
    get edit_auctionn_url(@auctionn)
    assert_response :success
  end

  test "should update auctionn" do
    patch auctionn_url(@auctionn), params: { auctionn: { actual: @auctionn.actual, fecha: @auctionn.fecha, minimo: @auctionn.minimo, participantes: @auctionn.participantes, precio: @auctionn.precio, puja: @auctionn.puja } }
    assert_redirected_to auctionn_url(@auctionn)
  end

  test "should destroy auctionn" do
    assert_difference('Auctionn.count', -1) do
      delete auctionn_url(@auctionn)
    end

    assert_redirected_to auctionns_url
  end
end
