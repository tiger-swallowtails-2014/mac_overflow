Rails.application.routes.draw do

  resources :users do
    resources :questions, name_prefix: "user_"
  end

  resources :questions do
    resources :answers, name_prefix: "question_"
  end

  resources :answers do
    resources :responses, name_prefix: "answer_"
  end



  root 'responses#index'
end
