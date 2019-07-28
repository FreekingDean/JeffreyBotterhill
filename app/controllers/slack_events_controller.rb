class SlackEventsController < ApplicationController
  before_action :handle_challenge

  def create
  end

  private
  def handle_challenge
    if params[:type] == 'url_verification'
      render json: {challenge: params[:challenge]}
    end
  end
end
