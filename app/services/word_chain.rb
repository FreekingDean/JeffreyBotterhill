# The class WordChain attempts to chain words together
# it is mostly like Markov
class WordChain
  class << self
    def next_word(previous_tokens)
      find_best_token(Entry.get_words(gram_1: previous_tokens[1], gram_2: previous_tokens[0]))
    end

    def bigram_word(previous_token)
      find_best_token(Entry.get_words(gram_1: previous_token))
    end

    private

    def find_best_token(tokens)
      return '' unless tokens.any?
      tokens.each_with_index do |token, index|
        token.probability = (1.0/(2.00**(index+1)))
      end

      random_num = rand*0.65

      tokens.each do |entries|
        if (random_num) < (entries.probability)
          return entries.word
        end
        random_num -= entries.probability
      end

      tokens.last.word
    end
  end
end
