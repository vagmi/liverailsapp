Liverailsapp::Application.routes.draw do
  resources :rooms
  root :to=>'rooms#index'
  delete '/logout', :to=>'sessions#destroy'
  get 'subscribe/:channel_name', :to=>'subscriptions#subscribe'
  get '/auth/:provider/callback', :to=>"sessions#create"
end
