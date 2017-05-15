Rails.application.routes.draw do

  get '/home/index'

  get '/', to: 'home#index'

  resources :product
  resources :rate_plan

end
