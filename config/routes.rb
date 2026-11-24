Rails.application.routes.draw do
  get 'home', to: 'home#index'
  get 'game', to: 'game#show'
  get 'scores', to: 'scores#index'

  get 'questions', to: 'questions#index'
  get 'questions/new', to: 'questions#new', as: 'new_question'
  post 'questions', to: 'questions#create'
  get 'questions/:id', to: 'questions#edit', as: 'edit_question'
  patch 'questions/:id', to: 'questions#update'
  put 'questions/:id', to: 'questions#update'
  delete 'questions/:id', to: 'questions#destroy', as: 'question'

  post 'game/process_answer', to: 'game#process_answer', as: 'process_answer'

  root 'home#index'
end
