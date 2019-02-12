class Store < ApplicationRecord
    has_many :comments
    has_many :guests, through: :comments
    has_many :shops

    STORE_TYPE = ["Traditional", "WM"]
end