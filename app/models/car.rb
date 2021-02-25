class Car < ApplicationRecord

    belongs_to :make
    belongs_to :user

    validates :make, :color, :price, presence: true
    validates :price, numericality: { greater_than: 0 }
    validates :make, uniqueness: {scope: :color, message: "with that color has already been added"}


    def make_attributes=(attr)
        self.make = Make.find_or_create_by(name: attr[:name])
    end

    def make_and_color
        "#{self.make.name} - #{self.color}"
    end

    def display_price #just use number_to_currency instead
        split_price = self.price.to_s.split(".")
        if split_price[1].length == 1
            split_price[1] << "0"
        elsif split_price[1].length == 0       
            split_price[1] << "00"
        end
        display = split_price.join(".")
        "$#{display}"
    end

    def self.ordered_by_price
        self.order(price: :desc)

    end
end
