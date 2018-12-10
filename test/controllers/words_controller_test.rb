class WordsControllerTest < ActionDispatch::IntegrationTest

  test '#word_count_per_sentence' do
    post url_for(controller: :words, action: :word_count_per_sentence),
      params: { evaluated_string: 'This is a sentence. And another one.' }

    expected_response = {
      'This is a sentence.': 4,
      'And another one.': 3
    }.to_json

    assert_equal expected_response, JSON.parse(response.body)
    assert_response 200
  end
end
