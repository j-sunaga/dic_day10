Rails.application.routes.draw do
  resources :blogs

  #user routing
  resource :users, only: [:create]
  get '/users/sign_up', to: 'users#new', as: 'new_user'

  get '/mypage/:id', to: 'users#show', as: 'user'
  patch '/mypage/:id', to: 'users#update'
  put '/mypage/:id', to: 'users#update'

  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'

end
