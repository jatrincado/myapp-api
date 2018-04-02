class ApplicationController < ActionController::Base
  include Response
  include ExceptionHandler

  protect_from_forgery with: :null_session

  def after_sign_in_path_for(resource)
    articles_path
  end
end
