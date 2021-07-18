Rails.application.routes.draw do
  resources :top_tracks

  get '/auth/spotify/callback', to: 'top_tracks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
