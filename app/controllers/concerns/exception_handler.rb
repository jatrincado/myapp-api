module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response(render e, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response(render e, :unprocessable_entity)
    end
  end
end
