class BaseController < ApplicationController
  rescue_from ActionController::ParameterMissing do |exception|
    render json: {error: {message: exception.message}}, status: :bad_request
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: {error: {message: exception.message}}, status: :not_found
  end
end

