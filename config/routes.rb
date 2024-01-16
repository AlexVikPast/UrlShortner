Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root 'links#new'
  get '/s/:slug', to: 'links#show', as: :short
  resources :links #, :only => [:show, :create]

  # Подключаем шрифты
  get '/fonts/glyphicons-halflings-regular.woff', to: redirect('/assets/glyphicons-halflings-regular.woff')
  get '/assets/javascripts/bootstrap.min.js', to: redirect('/assets/javascripts/bootstrap.min.js')
  get '/assets/stylesheets/main.css', to: redirect('/assets/stylesheets/main.css')
  get '/assets/stylesheets/bootstrap.css', to: redirect('/assets/stylesheets/bootstrap.css')

  get "/about/", to: "about#index"
end
