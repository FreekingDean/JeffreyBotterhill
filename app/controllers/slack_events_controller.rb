class SlackEventsController < ApplicationController
  before_action :handle_challenge

  def create
    if params[:type] != 'event_callback'
      error "Uh oh! #{params}"
    end

    if params[:event][:type] == 'message'
      Learn.train_phrase(params[:event][:text])
    end
  end

  private
  def handle_challenge
    if params[:type] == 'url_verification'
      render json: {challenge: params[:challenge]}
    end
  end
end
