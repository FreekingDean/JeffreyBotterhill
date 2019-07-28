require 'engtagger'

# Tagger adds english parts of speach tags to a phrase
class Tagger
  def initialize(phrase)
    @old_tagged = tagger.add_tags(phrase)
    @tagged = tagger.get_readable(phrase)
  end

  def nouns
    tagger.get_nouns(@old_tagged).keys
  end

  def proper_nouns
    tagger.get_proper_nouns(@old_tagged).keys
  end

  def tag_hash
    Lexicon.get_tokens(@tagged).map { |wt| wt.split('/') }.to_h
  end

  def tag_array
    Lexicon.get_tokens(@tagged).map { |wt| wt.split('/') }.map(&:second)
  end

  private

  def tagger
    @tagger ||= EngTagger.new
  end
end
