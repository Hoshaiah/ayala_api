class Graph < ApplicationRecord
    validates :name, uniqueness: true
end
