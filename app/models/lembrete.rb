class Lembrete < ApplicationRecord
    has_one :tarefas

    validates :data, presence: true
    validates :descricao, presence: true
end
