module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response(error: 'Not found', message: e.message, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response({ error: 'Unprocessable entity', message: e.message }, :unprocessable_entity)
    end
  end
end
