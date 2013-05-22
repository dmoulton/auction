class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_client_id
  before_filter :intercept_html_requests

  layout nil

  private

  def intercept_html_requests
    render 'layouts/application' if request.format == Mime::HTML
  end

  def set_client_id
    gon.client_id = GOOGLE_CLIENT_ID
  end
end
