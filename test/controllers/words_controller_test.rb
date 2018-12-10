class WordsControllerTest < ActionDispatch::IntegrationTest

  test '#word_count_per_sentence' do
    post url_for(controller: :words, action: :word_count_per_sentence),
      params: { string_to_evaluate: 'This is a sentence. And another one.' }

    expected_response = {
      'This is a sentence.': 4,
      'And another one.': 3
    }.to_json

    assert_equal expected_response, response.body
    assert_response 200
  end

  test '#total_letter_count' do
    post url_for(controller: :words, action: :total_letter_count),
      params: { string_to_evaluate: 'Easy sentence.' }

    expected_response = {
      'e': 4,
      'a': 1,
      's': 2,
      'y': 1,
      'n': 2,
      't': 1
    }.to_json

    assert_equal expected_response, response.body
    assert_response 200
  end
end
