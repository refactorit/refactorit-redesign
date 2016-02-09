Rails.application.routes.draw do
  devise_for :users, path: 'pirates', path_names: {sign_in: 'boarding' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
  root to: 'pages#home'
  # Pages routes
  get 'about', to: 'pages#about'
  get 'team', to: 'pages#team'
  get 'contact', to: 'pages#contact'
  get 'services', to: 'pages#services'
end
