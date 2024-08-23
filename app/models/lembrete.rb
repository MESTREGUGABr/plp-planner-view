class Lembrete < ApplicationRecord
    has_one :tarefa

    validates :data, presence: true
    validates :descricao, presence: true
end
