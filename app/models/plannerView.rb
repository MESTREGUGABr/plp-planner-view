class PlannerView < ActiveRecord::Base
    has_one :user
    has_many :atividade

    validates :nome, presence: true
end