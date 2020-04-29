class BaseController < ApplicationController
  before_action :auth_user

  rescue_from ActionController::ParameterMissing do |exception|
    render json: {error: {message: exception.message}}, status: :bad_request
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: {error: {message: exception.message}}, status: :not_found
  end

  def auth_user
    unless request.headers['Authorization']
      return render json: {error: {message: 'unauthorized user'}}, status: 401
    end
    @current_user ||= User.find_by(auth_token: request.headers['Authorization'])

    unless @current_user
      return render json: {error: {message: 'User Not found'}}, status: 403
    end
  end
end

