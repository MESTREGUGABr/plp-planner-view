class Atividade < ApplicationRecord
    belongs_to :planner_view
    belongs_to :tarefa
    has_one :status

    validates :nome, presence: true
    validates :descricao, presence: true
    validates :prioridade, presence: true
    validates :data, presence: true
end
