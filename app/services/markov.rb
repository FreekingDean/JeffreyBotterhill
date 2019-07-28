# Markov saves the the Ngrams gets the subject and
# forms the next sentence
class Markov
  def self.go(query)
    subject = Lexicon.get_subject(query)
    Formulator.create_sentence_random(subject)
  end
end
