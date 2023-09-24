Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # resources :graphs
  post 'graph/', to: 'graphs#create', as: 'create_graph'
  put 'graph/', to: 'graphs#update', as: 'update_graph'
  get 'graph/', to: 'graphs#show', as: 'get_graph'
  get 'graphs/', to: 'graphs#index', as: 'get_graphs'

  get 'logs/', to: 'logs#index', as: 'get_logs'
  post 'log/', to: 'logs#create', as: 'create_log'

end
