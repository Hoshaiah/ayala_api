class Car < ApplicationRecord
    has_many :logs
    has_many :graphs, through: :logs
end
