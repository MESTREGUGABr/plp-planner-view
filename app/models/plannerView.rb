class PlannerView < ActiveRecord::Base
    has_one :user
    has_many :atividades

    validates :nome, presence: true
end