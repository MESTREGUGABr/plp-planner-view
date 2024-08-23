class Metum < ApplicationRecord
    has_one :categoria
    has_one :status

    validates :data_inicio, presence: true
    validates :data_fim, presence: true
    validates :descricao, presence: true
end
