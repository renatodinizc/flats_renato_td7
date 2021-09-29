class PropertyRegion < ApplicationRecord
    has_many :properties
    validates :name, presence: true
    validates :name, uniqueness: true
end
