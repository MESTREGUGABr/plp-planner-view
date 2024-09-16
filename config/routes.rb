Rails.application.routes.draw do
  get 'passwords/new'
  get 'passwords/edit'
  
  # Rota para verificar a saúde da aplicação
  get "up" => "rails/health#show", as: :rails_health_check

  # Rotas de login e cadastro
  get 'signup', to: 'users#new', as: 'signup'
  post 'signup', to: 'users#create'

  get 'get_all_users', to: 'users#get_all_users'
  get 'login', to: 'users#login'
  post 'login', to: 'users#create_session', as: 'create_session_users'

  # Rota para redefinir senha
  get 'password/new', to: 'passwords#new', as: :new_password
  post 'password/reset', to: 'passwords#create', as: :reset_password
  get 'password/edit', to: 'passwords#edit', as: :edit_password
  patch 'password/update', to: 'passwords#update', as: :password_update

  # Definição da rota raiz para a tela de login
  root 'users#login'

  # Rota para a tela inicial
  get 'home', to: 'users#home', as: 'home'

  # Rota para sair da conta
  get '/logout', to: 'sessions#destroy'

  # Rotas para emitir relatórios
  get 'emitir_relatorio', to: 'reports#emitir', as: 'emitir_relatorio'
 
  # Definições das rotas para os recursos
  resources :tarefas
  resources :categorias
  resources :lembretes
  resources :metas
  resources :users
  resources :planner_views
  resources :statuses
end
