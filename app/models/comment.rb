class Comment < ApplicationRecord
    belongs_to :store
    belongs_to :user
    belongs_to :guest
    # has_many :comment_updates
    # accepts_nested_attributes_for :comment_updates
    validates :case_number, uniqueness: true

    COMMENT_TYPES = ["Complaint", "Compliment", "Inquiry"]
    SOURCE = ["1-800#", "VOICE", "Local"]
    URGENT = ["General", "Urgent"]
    CONTACT_TYPE = ["Phone", "Email", "Mail", "Voice", "Other"]
    ORDER_POINT = ["DT", "FC", "Mobile", "Kiosk", "Delivery", "Other"]
    STATUS = ["Open", "Closed"]

    def guest_attributes=(guest)
        self.guest = Guest.find_or_create_by(first_name: guest[:first_name])
        self.guest.update(guest)
    end
end
