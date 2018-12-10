Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/words/word_count_per_sentence', to: "words#word_count_per_sentence"
  post 'words/total_letter_count', to: "words#total_letter_count"
end
