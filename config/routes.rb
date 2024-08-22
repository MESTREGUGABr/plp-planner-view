Rails.application.routes.draw do
  # Define rotas padrão para o controller Atividades
  resources :atividades
  resources :users
  resources :planner_views
  resources :statuses

end
