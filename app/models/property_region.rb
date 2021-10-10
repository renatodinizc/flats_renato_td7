class PropertyRegion < ApplicationRecord
    has_many :properties, dependent: :destroy
    validates :name, presence: true
    validates :name, uniqueness: true
end
