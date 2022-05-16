Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get '/user/sign_in' => 'pages#show'
  root 'pages#show'
end
