class Categoria < ApplicationRecord
    belongs_to :Tarefa
    belongs_to :Metum

    validates :nome, presence: true
end
