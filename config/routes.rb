Rails.application.routes.draw do

    ## Here I would make an example route hierarchy (best scale):
    ## api>v1>endpoints 
    ## namespace :api do
    ## namespace :v1 do
    ##    resources :events
    ##    resources :products
    ##    resources :carts
    ##    resources :tickets
    ##  end
    ## end

    # Events
    get '/events' => 'events#index'
    get '/events/:id' => 'events#find'
    post '/events' => 'events#create'

    # Products
    get '/products' => 'products#index'
    get '/products/:id' => 'products#find'
    post '/products' => 'products#create'

    # Carts
    get  '/carts' => 'carts#index'
    get  '/carts/:id' => 'carts#find'
    post '/carts' => 'carts#create'
    post '/carts/:id/products' => 'carts#addProduct'
    delete '/carts/:id/products' => 'carts#removeProduct'
    post '/carts/:id/events' => 'carts#addEvent'
    delete '/carts/:id/events' => 'carts#removeEvent'

    # Tickets
    get  '/tickets' => 'tickets#index'
    get '/tickets/:id' => 'tickets#find'
    post '/tickets' => 'tickets#create'

end
