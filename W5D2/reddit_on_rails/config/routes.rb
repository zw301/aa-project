Rails.application.routes.draw do


  resources :comments

  resources :users

  resources :subs

  resources :posts do
    resources :comments
  end
  resource :session
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
