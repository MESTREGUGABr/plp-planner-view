class Tarefa < ApplicationRecord
    belongs_to :status
    belongs_to :categoria
  # belongs_to :lembrete

    validates :data, presence: true
    validates :descricao, presence: true
    validates :bloco, presence: true
    validates :categoria_id, presence: true
end
