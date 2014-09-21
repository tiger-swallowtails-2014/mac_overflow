Rails.application.routes.draw do

  root 'users#index'

  resources :users do
    resources :questions, name_prefix: "user_"
  end

  resources :questions do
    resources :answers, name_prefix: "question_"
  end

  resources :answers do
    resources :responses, name_prefix: "answer_"
  end

  get '/answers/:id/upvote', to: "answers#upvote", as: "upvote_answer"
  get '/answers/:id/downvote', to: "answers#downvote", as: "downvote_answer"

  root 'questions#index'
end
