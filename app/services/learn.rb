# Learn remembers old inputs
class Learn
  class << self
    def train_phrase(input)
      Lexicon.clean!(input)
      tagger = Tagger.new(input)
      train_array(
        Ngram.current_gram(Lexicon.get_tokens(input)),
        tagger.tag_array.flatten
      )
    end

    def train_array(inputs, tags)
      inputs.reverse!
      inputs.each_with_index do |input, index|
        trainable = {
          gram_2: input[0],
          gram_1: input[1],
          word: input[2]
        }
        tag = tags[index].nil? ? '?' : tags[index]

        train(trainable, tag)
      end
    end

    def train(input, tag)
      learn_data = Entry.find_or_initialize_by(input.merge(tag: tag))
      learn_data.count = (learn_data.count || 0) + 1
      learn_data.save
    end
  end
end
