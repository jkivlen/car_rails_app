class Make < ApplicationRecord

    has_many :cars
    has_many :users, through: :cars
    accepts_nested_attributes_for :cars

    validates :name, presence: true
    validates :name, uniqueness: true 

    
end
