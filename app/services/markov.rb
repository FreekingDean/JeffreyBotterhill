# Markov saves the the Ngrams gets the subject and
# forms the next sentence
class Markov
  def self.go(query)
    Learn.train_phrase(query) if Lexicon.get_number_of_tokens(query) >= 3
    subject = Lexicon.get_subject(query)
    Formulator.create_sentence_random(subject)
  end
end
