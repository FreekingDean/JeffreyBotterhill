# Formulator makes the sentences
class Formulator
  class << self
    def create_sentence(length, subject)
      result = []
      result << subject.chomp
      previous_token = subject
      token = WordChain.bigram_word(previous_token)
      (0..length).each do |_|
        break if token.blank?
        result << token.chomp
        earlier_token = previous_token
        previous_token = token
        token = next_word(earlier_token, previous_token)
      end
      sentencify(result)
    end

    def create_sentence_random(subject)
      create_sentence(3 + rand(8), subject)
    end

    private

    def next_word(earlier_token, previous_token)
      token = WordChain.next_word([earlier_token, previous_token])
      if token.blank? && rand < 0.6 || rand < 0.01
        WordChain.bigram_word(previous_token)
      else
        token
      end
    end

    def sentencify(word_arr)
      "#{word_arr.first.titleize} #{word_arr[1..-1].join(' ').strip}."
    end
  end
end
