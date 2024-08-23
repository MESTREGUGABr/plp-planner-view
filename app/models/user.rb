class User < ApplicationRecord
    belongs_to :plannerView

    # Validações, relacionamentos e métodos podem ser adicionados aqui
    validates :nome, presence: true
    validates :senha, presence: true
    validates :email, presence: true
    
  end