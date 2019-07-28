require 'awesome_print'

# JeffServer listens on the proper queues
class JeffServer
  def initialize(ch)
    @ch = ch
  end

  def start(queue_name: 'jeff_bot')
    subscribe(queue_name, Botsolver, respond: true, blocking: true)
  end

  def learn(queue_name: 'jeff_bot_learn')
    subscribe(queue_name, Learner)
  end

  def respond(queue_name: 'jeff_bot_respond')
    subscribe(queue_name, Responder, respond: true)
  end

  private

  def subscribe(queue_name, message_parser, blocking: false, respond: false)
    App.logger.info "STARTING QUEUE #{queue_name}"
    queue = @ch.queue(queue_name)
    exchange = @ch.default_exchange

    queue.subscribe(block: blocking) do |_, properties, payload|
      r = parse_message(message_parser, payload)

      begin
        exchange.publish(
          r,
          routing_key: properties.reply_to,
          correlation_id: properties.correlation_id
        ) if respond
      rescue StandardError => ex
        App.logger.error ex
      end
    end
  end

  def parse_message(message_parser, payload)
    message_parser.go(payload)
  rescue StandardError => ex
    App.logger.error ex
    "ERROR: #{ex}"
  end
end
