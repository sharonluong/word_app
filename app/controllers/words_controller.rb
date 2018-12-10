class WordsController < ApplicationController
  def word_count_per_sentence
    render json: { response: 200 }
  end

  def total_letter_count
  end
end
