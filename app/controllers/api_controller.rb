class ApiController < ApplicationController
  before_action :api_authenticate

  # ensure that our API client is legit
  def api_authenticate
    key = "1e8bb9ef2387e59b133"
    head(:unauthorized) unless key == params[:key]
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: {errors: ["Request unauthorized and unfulfilled."]}, status: :unprocessable_entity
  end

end
