class LeaveTypesController < ApplicationController
  before_action :set_leave_type, only: [:show, :update, :destroy]

  # GET /leave_types
  # GET /leave_types.json
  def index
    @leave_types = LeaveType.all

    render json: @leave_types
  end

  # GET /leave_types/1
  # GET /leave_types/1.json
  def show
    render json: @leave_type
  end

  # POST /leave_types
  # POST /leave_types.json
  def create
    @leave_type = LeaveType.new(leave_type_params)

    if @leave_type.save
      render json: @leave_type, status: :created, location: @leave_type
    else
      render json: @leave_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /leave_types/1
  # PATCH/PUT /leave_types/1.json
  def update
    @leave_type = LeaveType.find(params[:id])

    if @leave_type.update(leave_type_params)
      head :no_content
    else
      render json: @leave_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /leave_types/1
  # DELETE /leave_types/1.json
  def destroy
    @leave_type.destroy

    head :no_content
  end

  private

    def set_leave_type
      @leave_type = LeaveType.find(params[:id])
    end

    def leave_type_params
      params.require(:leave_type).permit(:user_id, :type, :quota)
    end
end
