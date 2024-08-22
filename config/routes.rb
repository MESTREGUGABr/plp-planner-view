Rails.application.routes.draw do
  # Rota para verificar a saúde da aplicação
  get "up" => "rails/health#show", as: :rails_health_check

  # Definições das rotas para os recursos
  resources :tarefas
  resources :categorias
  resources :lembretes
  resources :metas

  # Defina a rota raiz ("/") se desejar
  # root "tarefas#index"  # ou outro controlador e ação que você preferir
end
