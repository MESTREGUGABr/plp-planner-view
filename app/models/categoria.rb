class Categoria < ApplicationRecord
    belongs_to :tarefa
    belongs_to :metum

    validates :nome, presence: true
end
