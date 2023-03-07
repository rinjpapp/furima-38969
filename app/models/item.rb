class Item < ApplicationRecord
  with_options presence: true do  
    validates :title
    validates :content
    validates :category_id
    validates :condition_id
    validates :shipping_option_id
    validates :prefecture_id
    validates :shipping_term_id
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }

  belongs_to :user
end
