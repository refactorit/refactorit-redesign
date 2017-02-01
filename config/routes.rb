Rails.application.routes.draw do
  devise_for :users, path: 'pirates', path_names: {sign_in: 'boarding' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#home'
  # Pages routes
  get 'services',          to: 'pages#services'
  get 'thank-you',         to: 'pages#thank_you', as: :thank_you
  # Contact routes
  get 'contact',           to: 'contact#new',            as: :contact_new
  post 'send-question',    to: 'contact#send_question'
  # Posts routes
  resources :posts, except: [:index, :edit, :new]
  resources :blog, only: [:index, :show], controller: :posts
  scope "pirates" do
    resources :posts, only: [:edit, :new]
    resources :news
    resources :attachments, only: [:index, :new, :create, :destroy]
  end
  get  'pirates/posts', to: 'posts#admin_index', as: :admin_posts
  get  'authors/:id', to: 'posts#author_index', as: :author_posts
  get  'topics/:id', to: 'posts#topic_index', as: :topic_posts
  get  '/:year/:month/:slug', to: redirect('/posts/%{slug}'), year: /\d{4}/, month: /\d{2}/


  get  '*path', to: 'pages#page_not_found', as: :page_not_found
end
