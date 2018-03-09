Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cats, except: :destroy
  resources :cat_rental_requests, only: %i(new create) do
    post 'approve', on: :member
    post 'deny', on: :member
  end

  resources :users, only: %i(new create show)

  resource :session, only: %i(new create destroy)

  root to: redirect('/cats')
end
