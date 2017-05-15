Rails.application.routes.draw do

  get '/', to: 'home#index'

  resources :product
end
