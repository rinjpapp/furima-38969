class OrderRecord < ApplicationRecord
  belongs_to :user
	belongs_to :item
	has_one :address_list

end
