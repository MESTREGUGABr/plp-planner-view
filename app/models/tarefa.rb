class Tarefa < ApplicationRecord
    has_one :atividades
    has_one :statuses
    has_one :categorias
    belongs_to :Lembrete

    validates :data, presence: true
    validates :descricao, presence: true
    validates :bloco, presence: true
end
