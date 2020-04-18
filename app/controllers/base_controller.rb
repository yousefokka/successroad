class BaseController < ApplicationController
  rescue_from ActionController::ParameterMissing do |exception|
    render json: {error: {message: exception.message}}, status: 400
  end
end

