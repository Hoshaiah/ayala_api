Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :graphs
  put 'graphs/', to: 'graphs#update', as: 'update_graph'
  get 'graph/', to: 'graphs#show', as: 'get_graph'
  get 'graphs/', to: 'graphs#index', as: 'get_graphs'
end
