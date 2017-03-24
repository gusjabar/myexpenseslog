require 'test_helper'

class ExpensivesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @expensife = expensives(:one)
  end

  test "should get index" do
    get expensives_url
    assert_response :success
  end

  test "should get new" do
    get new_expensife_url
    assert_response :success
  end

  test "should create expensife" do
    assert_difference('Expensive.count') do
      post expensives_url, params: { expensife: { amount: @expensife.amount, category_id: @expensife.category_id, logdate: @expensife.logdate, note: @expensife.note, subcategory_id: @expensife.subcategory_id } }
    end

    assert_redirected_to expensife_url(Expensive.last)
  end

  test "should show expensife" do
    get expensife_url(@expensife)
    assert_response :success
  end

  test "should get edit" do
    get edit_expensife_url(@expensife)
    assert_response :success
  end

  test "should update expensife" do
    patch expensife_url(@expensife), params: { expensife: { amount: @expensife.amount, category_id: @expensife.category_id, logdate: @expensife.logdate, note: @expensife.note, subcategory_id: @expensife.subcategory_id } }
    assert_redirected_to expensife_url(@expensife)
  end

  test "should destroy expensife" do
    assert_difference('Expensive.count', -1) do
      delete expensife_url(@expensife)
    end

    assert_redirected_to expensives_url
  end
end
