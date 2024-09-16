class PlannerView < ActiveRecord::Base
    has_one :user

    validates :nome, presence: true
end