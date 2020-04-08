class Battery < ApplicationRecord
    has_many :columns
    belongs_to :building
    has_many :interventions
end
