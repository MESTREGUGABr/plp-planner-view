Rails.application.routes.draw do
  # Rota para verificar a saúde da aplicação
  get "up" => "rails/health#show", as: :rails_health_check

  # Rotas de login e cadastro
  get 'signup', to: 'users#new', as: 'signup'
  post 'signup', to: 'users#create'

  get 'get_all_users', to: 'users#get_all_users'
  get 'login', to: 'users#login'
  post 'login', to: 'users#create_session', as: 'create_session_users'

  # Definição da rota raiz para a tela de login
  root 'users#login'

  # Rota para a tela inicial
  get 'home', to: 'users#home', as: 'home'

  # Rota para sair da conta
  get '/logout', to: 'sessions#destroy'


  # Definições das rotas para os recursos
  resources :tarefas
  resources :categorias
  resources :lembretes
  resources :metas
  resources :atividades
  resources :users
  resources :planner_views
  resources :statuses

  # Defina a rota raiz ("/") se desejar
  # root "tarefas#index"  # ou outro controlador e ação que você preferir
end
