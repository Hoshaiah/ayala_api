class Graph < ApplicationRecord
    has_many :logs
    validates :name, uniqueness: true
end
