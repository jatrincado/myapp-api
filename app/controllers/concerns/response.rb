module Response
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  #def json_response_truncate(object, status =:ok)
  #  render json: 
end
