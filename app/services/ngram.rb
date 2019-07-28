# Ngram fings a set of Xgrams in a sentence
class Ngram
  CURRENT_GRAM_NUMBER = 3
  class << self
    def ngrams(n, array)
      array.each_cons(n).to_a
    end

    def bigram(array)
      ngrams(2, array)
    end

    def trigram(array)
      ngrams(3, array)
    end

    def current_gram(array)
      ngrams(CURRENT_GRAM_NUMBER, array)
    end
  end
end
