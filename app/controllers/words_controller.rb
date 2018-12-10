require 'json'
class WordsController < ApplicationController
  def word_count_per_sentence
    hash_of_sentences = Word.evaluate_string(params[:string_to_evaluate])

    json_response(hash_of_sentences)
  end

  def total_letter_count
    letter_number_count = Word.letter_count(params[:string_to_evaluate])

    json_response(letter_number_count)
  end
end
