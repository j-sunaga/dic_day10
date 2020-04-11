Rails.application.routes.draw do
  resources :blogs

  #user routing
  resource :users, only: [:create]
  get '/users/sign_up', to: 'users#new', as: 'new_user'
  get '/mypage/:id', to: 'users#show', as: 'user'
  patch '/mypage/:id', to: 'users#update'
  put '/mypage/:id', to: 'users#update'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'

  #Login routing
  get '/users/sign_in', to: 'sessions#new', as: 'new_sessions'
  post   '/users/sign_in', to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy', as: 'delete_sessions'

end
