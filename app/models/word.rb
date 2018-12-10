class Word < ActiveRecord::Base

  def self.evaluate_string(sentences)
    # first, split string into parts by punctuation
    parts = sentences.strip.split(/(\.|\?|\!)/)

    # then reform complete sentences
    individual_sentences = parts.each_slice(2).to_a.map {|pair| pair.join}

    hash_of_sentences = {}

    individual_sentences.each do |sentence|
      word_count = Word.count_words(sentence)
      hash_of_sentences[sentence.lstrip] = word_count
    end

    hash_of_sentences
  end

  def self.count_words(sentence)
    array_of_words = sentence.split(' ')
    array_of_words.length
  end

  def self.letter_count(sentence)
    # strip out spaces, split each element
    array_of_letters = sentence.downcase.split(//)
    
    #get the unique letters
    unique_letters = array_of_letters.uniq

    letter_count_hash = {}
    unique_letters.each do |letter|
      letter_count_hash[letter] = array_of_letters.sum { |s| s.count(letter) }
    end

    letter_count_hash
  end
end
