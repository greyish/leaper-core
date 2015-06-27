class LeaveTypesController < ApplicationController
  before_action :set_leave_type, only: [:show, :update, :destroy]
  before_action :set_user

  def index
    @leave_types = @user.leave_types.map{|lt|
      lt.as_json.except("id", "user_id", "created_at", "updated_at")
    }

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
      render json: {res_id: 1}
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
      params.permit(:user_id, :name, :quota)
    end

    def set_user
      unless @user = User.find_by_id(params[:user_id])
        render json: {"error" => "Invalid User Id"}
      end
    end
end
