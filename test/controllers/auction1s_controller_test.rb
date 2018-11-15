require 'test_helper'

class Auction1sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auction1 = auction1s(:one)
  end

  test "should get index" do
    get auction1s_url
    assert_response :success
  end

  test "should get new" do
    get new_auction1_url
    assert_response :success
  end

  test "should create auction1" do
    assert_difference('Auction1.count') do
      post auction1s_url, params: { auction1: { fecha: @auction1.fecha, nombre: @auction1.nombre, precio: @auction1.precio, puja: @auction1.puja } }
    end

    assert_redirected_to auction1_url(Auction1.last)
  end

  test "should show auction1" do
    get auction1_url(@auction1)
    assert_response :success
  end

  test "should get edit" do
    get edit_auction1_url(@auction1)
    assert_response :success
  end

  test "should update auction1" do
    patch auction1_url(@auction1), params: { auction1: { fecha: @auction1.fecha, nombre: @auction1.nombre, precio: @auction1.precio, puja: @auction1.puja } }
    assert_redirected_to auction1_url(@auction1)
  end

  test "should destroy auction1" do
    assert_difference('Auction1.count', -1) do
      delete auction1_url(@auction1)
    end

    assert_redirected_to auction1s_url
  end
end
