require 'test_helper'

class LeaveTypesControllerTest < ActionController::TestCase
  setup do
    @leave_type = leave_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leave_types)
  end

  test "should create leave_type" do
    assert_difference('LeaveType.count') do
      post :create, leave_type: { quota: @leave_type.quota, type: @leave_type.type, user_id: @leave_type.user_id }
    end

    assert_response 201
  end

  test "should show leave_type" do
    get :show, id: @leave_type
    assert_response :success
  end

  test "should update leave_type" do
    put :update, id: @leave_type, leave_type: { quota: @leave_type.quota, type: @leave_type.type, user_id: @leave_type.user_id }
    assert_response 204
  end

  test "should destroy leave_type" do
    assert_difference('LeaveType.count', -1) do
      delete :destroy, id: @leave_type
    end

    assert_response 204
  end
end
