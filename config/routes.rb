Rails.application.routes.draw do

  get '/home/index'
  get '/', to: 'home#index'

  get '/api/product',     to: 'api#product'
	get '/api/product/:id', to: 'api#product'

  resources :product

  resources :rate_plan
	post '/rate_plan/retire/:id', to: 'rate_plan#retire'

end
