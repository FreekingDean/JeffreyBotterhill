class SlackEventsController < ApplicationController
  before_action :handle_challenge

  def create
    if params[:type] == 'app_mention'
      query = Lexicon.clean(params[:text])
      resp = Markov.go(query) 
      info resp
    end

    if params[:type] == 'event_callback'
      if params[:event][:type] == 'message'
        query = Lexicon.clean(params[:event][:text])
        Learn.train_phrase(query)
      end
    end
  end

  private
  def handle_challenge
    if params[:type] == 'url_verification'
      render json: {challenge: params[:challenge]}
    end
  end
end
