class Graph < ApplicationRecord
    has_many :logs
    has_many :cars, through: :logs

    validates :name, uniqueness: true
end
