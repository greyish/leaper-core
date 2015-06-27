module LeaveRequestProcess

  def leave_request_create(params)
    @employee.leave_requests.create(params)
  end
end
