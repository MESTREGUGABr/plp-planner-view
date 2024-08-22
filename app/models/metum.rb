class Metum < ApplicationRecord
    has_one :categorias
    has_one: statuses

    validates :data_inicio, presence: true
    validates :data_fim, presence: true
    validates :descricao, presence: true
end
