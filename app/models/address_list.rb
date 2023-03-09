class AddressList < ApplicationRecord

  with_options presence: true do
    validates :post_code
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number
  end

  belongs_to :order_record

end
