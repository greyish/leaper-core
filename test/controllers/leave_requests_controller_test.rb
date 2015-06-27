require 'test_helper'

class LeaveRequestsControllerTest < ActionController::TestCase
  setup do
    @leave_request = leave_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leave_requests)
  end

  test "should create leave_request" do
    assert_difference('LeaveRequest.count') do
      post :create, leave_request: { employee_id: @leave_request.employee_id, from: @leave_request.from, leave_type_id: @leave_request.leave_type_id, status: @leave_request.status, to: @leave_request.to }
    end

    assert_response 201
  end

  test "should show leave_request" do
    get :show, id: @leave_request
    assert_response :success
  end

  test "should update leave_request" do
    put :update, id: @leave_request, leave_request: { employee_id: @leave_request.employee_id, from: @leave_request.from, leave_type_id: @leave_request.leave_type_id, status: @leave_request.status, to: @leave_request.to }
    assert_response 204
  end

  test "should destroy leave_request" do
    assert_difference('LeaveRequest.count', -1) do
      delete :destroy, id: @leave_request
    end

    assert_response 204
  end
end
