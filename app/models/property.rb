class Property < ApplicationRecord
    validates :title, :description, :rooms, :bathrooms, :daily_rate, presence: true
end
