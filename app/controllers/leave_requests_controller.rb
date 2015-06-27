class LeaveRequestsController < ApplicationController
  before_action :set_leave_request, only: [:show, :update, :destroy]

  # GET /leave_requests
  # GET /leave_requests.json
  def index
    @leave_requests = LeaveRequest.all

    render json: @leave_requests
  end

  # GET /leave_requests/1
  # GET /leave_requests/1.json
  def show
    render json: @leave_request
  end

  # POST /leave_requests
  # POST /leave_requests.json
  def create
    @leave_request = LeaveRequest.new(leave_request_params)

    if @leave_request.save
      render json: @leave_request, status: :created, location: @leave_request
    else
      render json: @leave_request.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /leave_requests/1
  # PATCH/PUT /leave_requests/1.json
  def update
    @leave_request = LeaveRequest.find(params[:id])

    if @leave_request.update(leave_request_params)
      head :no_content
    else
      render json: @leave_request.errors, status: :unprocessable_entity
    end
  end

  # DELETE /leave_requests/1
  # DELETE /leave_requests/1.json
  def destroy
    @leave_request.destroy

    head :no_content
  end

  private

    def set_leave_request
      @leave_request = LeaveRequest.find(params[:id])
    end

    def leave_request_params
      params.require(:leave_request).permit(:employee_id, :leave_type_id, :from, :to, :status)
    end
end
