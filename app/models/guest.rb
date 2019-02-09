class Guest < ApplicationRecord
    has_many :comments
    has_many :stores, through: :comments

    def full_name
        "#{first_name} #{last_name}"
    end
end
