class SlackEventsController < ApplicationController
  before_action :handle_challenge

  def create
    if params[:type] != 'event_callback'
      logger.error "Bad req #{params}"
      render json: {success: false}
    end

    event = params[:event]

    if event[:type] == 'app_mention'
      query = Lexicon.clean(event[:text])
      resp = Markov.go(query) 
      slack_client.chat_postMessage(channel: event[:channel], text: resp)
    end

    if event[:type] == 'message'
      query = Lexicon.clean(event[:text])
      Learn.train_phrase(query) if Lexicon.get_number_of_tokens(query) >= 3
    end
  end

  private
  def handle_challenge
    if params[:type] == 'url_verification'
      render json: {challenge: params[:challenge]}
    end
  end

  def slack_client
    @client ||= Slack::Web::Client.new
  end
end
