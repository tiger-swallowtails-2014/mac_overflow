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


end
