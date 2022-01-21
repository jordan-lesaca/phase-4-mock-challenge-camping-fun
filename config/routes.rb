Rails.application.routes.draw do
  get "/activities", to: 'activities#index'
  delete "/activities/:id", to: 'activities#destroy'
  get "/campers", to: 'campers#index'
  get "/campers/:id", to: 'campers#show'
  post "/campers", to: 'campers#create'
  post "/signups", to: 'signups#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
