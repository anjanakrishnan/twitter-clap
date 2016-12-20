Rails.application.routes.draw do

 devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks", passwords: "passwords", confirmations: "confirmations" }
  root to: 'static_pages#index'
  devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'

  end    
  post '/users/create' => 'users#create', :as => :create_users
  resources :users 
  resources :tweets
  resources :companies 
  
  get 'static_pages/home'
  get 'static_pages/help'
  get 'user_mailer/send_email' 
  get '/help' => "static_pages#help"
 


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
