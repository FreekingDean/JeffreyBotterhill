require "google/cloud/language"

module Parser
  class GoogleParser
    def initialize(message)
      @document = language_client.document message
    end

    def sentiment
      @document.sentiment
    end

    def syntax
      @document.syntax
    end
    private

    def language_client
      @language_client ||= Google::Cloud::Language.new
    end
  end
end
