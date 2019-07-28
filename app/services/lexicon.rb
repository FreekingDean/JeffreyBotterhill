# Lexicon parses a sentence Lexographically
module Lexicon
  class << self
    def clean!(str)
      str.replace clean(str)
    end

    def clean(str)
      str.strip.downcase
    end

    def get_subject(query)
      tagger = Tagger.new(clean(query))
      nouns = tagger.nouns.sample
      proper_nouns = tagger.proper_nouns.sample
      return proper_nouns unless proper_nouns.nil?
      return nouns unless nouns.nil?
      query.split(' ').sample
    end

    def get_tokens(query)
      query.split(' ')
    end

    def get_number_of_tokens(query)
      get_tokens(query).length
    end

    def equal_tokens?(a, b)
      get_number_of_tokens(a) == get_number_of_tokens(b)
    end
  end
end
