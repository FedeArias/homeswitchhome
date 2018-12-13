require 'test_helper'

class HotsalesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hotsale = hotsales(:one)
  end

  test "should get index" do
    get hotsales_url
    assert_response :success
  end

  test "should get new" do
    get new_hotsale_url
    assert_response :success
  end

  test "should create hotsale" do
    assert_difference('Hotsale.count') do
      post hotsales_url, params: { hotsale: { fecha: @hotsale.fecha, nombre: @hotsale.nombre, precio: @hotsale.precio, preciohot: @hotsale.preciohot, property_id: @hotsale.property_id } }
    end

    assert_redirected_to hotsale_url(Hotsale.last)
  end

  test "should show hotsale" do
    get hotsale_url(@hotsale)
    assert_response :success
  end

  test "should get edit" do
    get edit_hotsale_url(@hotsale)
    assert_response :success
  end

  test "should update hotsale" do
    patch hotsale_url(@hotsale), params: { hotsale: { fecha: @hotsale.fecha, nombre: @hotsale.nombre, precio: @hotsale.precio, preciohot: @hotsale.preciohot, property_id: @hotsale.property_id } }
    assert_redirected_to hotsale_url(@hotsale)
  end

  test "should destroy hotsale" do
    assert_difference('Hotsale.count', -1) do
      delete hotsale_url(@hotsale)
    end

    assert_redirected_to hotsales_url
  end
end
