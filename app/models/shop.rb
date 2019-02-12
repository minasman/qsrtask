class Shop < ApplicationRecord
    belongs_to :store
    belongs_to :user

    SHOP_TYPE = ["FC", "DT"]
end
