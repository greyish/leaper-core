require 'test_helper'

class LeaveReviewsControllerTest < ActionController::TestCase
  setup do
    @leave_review = leave_reviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leave_reviews)
  end

  test "should create leave_review" do
    assert_difference('LeaveReview.count') do
      post :create, leave_review: { comment: @leave_review.comment, employee_id: @leave_review.employee_id, is_approved: @leave_review.is_approved, leave_request_id: @leave_review.leave_request_id }
    end

    assert_response 201
  end

  test "should show leave_review" do
    get :show, id: @leave_review
    assert_response :success
  end

  test "should update leave_review" do
    put :update, id: @leave_review, leave_review: { comment: @leave_review.comment, employee_id: @leave_review.employee_id, is_approved: @leave_review.is_approved, leave_request_id: @leave_review.leave_request_id }
    assert_response 204
  end

  test "should destroy leave_review" do
    assert_difference('LeaveReview.count', -1) do
      delete :destroy, id: @leave_review
    end

    assert_response 204
  end
end
