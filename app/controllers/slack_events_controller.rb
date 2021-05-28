class SlackEventsController < ApplicationController
  before_action :handle_challenge

  def create
    if params[:type] != 'event_callback'
      logger.error "Bad req #{params}"
      render json: {success: false}
    end

    event = params[:event]

    event_text = event[:text] || ""
    cleaned_query = Lexicon.clean(
      SlackCleaner.clean(event_text)
    )

    if event[:type] == 'app_mention' && event[:subtype] != 'bot_message'
      resp = Markov.go(cleaned_query) 
      slack_client.chat_postMessage(channel: event[:channel], text: resp)
    end

    if event[:type] == 'message'
      Learn.train_phrase(cleaned_query) if Lexicon.get_number_of_tokens(cleaned_query) >= 3
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
