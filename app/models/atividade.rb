class Atividade < ApplicationRecord
  # belongs_to :planner_view
  # belongs_to :tarefa
    has_one :status

    validates :nome, presence: true
    validates :descricao, presence: true, allow_nil: true  # Permitindo nil
    validates :prioridade, presence: true, allow_nil: true
    validates :data, presence: true, allow_nil: true
end
