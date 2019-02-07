Rails.application.routes.draw do
  get 'login', to:'users#new',as: :login_a
  root 'links#index'
  get 'about', to: 'sessions#new'
  resources :links, except: :index do
    resources :comments, only: [:create]
  end
  
  get 'newscomments' => 'comments#index',as: :n_c
  get 'submit' => 'links#new', as: :l_n
  resources :users, only: [:new, :create]
  
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
