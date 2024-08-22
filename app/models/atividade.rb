class Atividade < ApplicationRecord
    belongs_to :plannerView
    belongs_to :tarefa
    has_one :statuses

    validates :nome, presence: true
    validates :descricao, presence: true
    validates :prioridade, presence: true
    validates :data, presence: true
end
