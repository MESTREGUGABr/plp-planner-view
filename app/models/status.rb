class Status < ApplicationRecord
   # belongs_to :tarefa
   # belongs_to :meta

    validates :nome, presence: true
    validates :tarefa, presence: false
    validates :metum, presence: false
end
