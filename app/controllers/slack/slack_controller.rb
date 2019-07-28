class Slack::SlackController < ApplicationController
  before_action :handle_challenge

  private
  def handle_challenge
    if params[:type] == 'url_verification'
      respond_to :json, {challenge: params[:challenge]}
    end
  end
end
