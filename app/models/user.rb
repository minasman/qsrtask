class User < ApplicationRecord
    validates :first_name, :last_name, :position, :username, :password, presence: true
    validates :username, :email, uniqueness: true
    has_secure_password
    has_many :comments

    POSITIONS = ["Owner", "Director", "Operations Manager", "Maint Department Head", "Supervisor", "General Manager", "Manager", "Field Tech", "Office"]

    def full_name
        "#{first_name} #{last_name}"
    end
end
