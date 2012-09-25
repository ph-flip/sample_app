SampleApp::Application.routes.draw do
  resources :users

  resources :sessions, only: [:create, :new, :desetroy]
  
  root to: 'static_pages#home'

  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new', as: :signin
  match '/signout', to: 'sessions#destroy', via: :delete
  match '/edit',    to: 'users#edit'

  match '/help',    to: 'static_pages#help'
  match '/about',   to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'

end
