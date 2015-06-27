class LeaveReviewsController < ApplicationController
  before_action :set_leave_review, only: [:show, :update, :destroy]

  # GET /leave_reviews
  # GET /leave_reviews.json
  def index
    @leave_reviews = LeaveReview.all

    render json: @leave_reviews
  end

  # GET /leave_reviews/1
  # GET /leave_reviews/1.json
  def show
    render json: @leave_review
  end

  # POST /leave_reviews
  # POST /leave_reviews.json
  def create
    @leave_review = LeaveReview.new(leave_review_params)

    if @leave_review.save
      render json: @leave_review, status: :created, location: @leave_review
    else
      render json: @leave_review.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /leave_reviews/1
  # PATCH/PUT /leave_reviews/1.json
  def update
    @leave_review = LeaveReview.find(params[:id])

    if @leave_review.update(leave_review_params)
      head :no_content
    else
      render json: @leave_review.errors, status: :unprocessable_entity
    end
  end

  # DELETE /leave_reviews/1
  # DELETE /leave_reviews/1.json
  def destroy
    @leave_review.destroy

    head :no_content
  end

  private

    def set_leave_review
      @leave_review = LeaveReview.find(params[:id])
    end

    def leave_review_params
      params.require(:leave_review).permit(:leave_request_id, :employee_id, :comment, :is_approved)
    end
end
