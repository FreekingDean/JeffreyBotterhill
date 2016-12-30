class ApplicationController < ActionController::API
  before_action :authenticate_client

  protected
  def api_client
    @api_client
  end

  private
  def authenticate_client
    @api_client = ApiClient.find(get_authorization)
  end

  def get_authorization
    request.headers["HTTP_AUTHORIZATION"].gsub('JeffreyBotterhill ', '')
  end
end
