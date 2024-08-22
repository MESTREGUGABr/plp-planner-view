class Status < ApplicationRecord
    belongs_to :Tarefa
    belongs_to :Atividade
    belongs_to :Metum

    validates :nome, presence: true
end
