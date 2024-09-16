class Tarefa < ApplicationRecord
    has_one :status
    has_one :categoria
  # belongs_to :lembrete

    validates :data, presence: true
    validates :descricao, presence: true
    validates :bloco, presence: true
    validates :categoria_id, presence: true
end
