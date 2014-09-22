Rails.application.routes.draw do

  root 'questions#index'

  resources :users do
    resources :questions, name_prefix: "user_"
  end

  resources :questions do
    resources :answers, name_prefix: "question_"
  end

  resources :answers do
    resources :responses, :constraints => { :id => /.*/ }, name_prefix: "answer_"
  end

  get '/answers/:id/upvote', to: "answers#upvote", as: "upvote_answer"
  get '/answers/:id/downvote', to: "answers#downvote", as: "downvote_answer"
  get '/questions/:id/upvote', to: "questions#upvote", as: "upvote_question"
  get '/questions/:id/downvote', to: "questions#downvote", as: "downvote_question"

  # for BCrypt
  get '/' => 'home#index', as: :home
  get "/log_in" => "sessions#new"
  post "/log_in" => "sessions#create"
  get "/log_out" => "sessions#destroy", as: :log_out

  delete '/reponse/:id' => "responses#destroy", as: :response

end
