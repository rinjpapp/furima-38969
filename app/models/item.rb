class Item < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }
    validates :content
    validates :image
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_option
  belongs_to :prefecture
  belongs_to :shipping_term

  with_options presence: true, numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :shipping_option_id
    validates :prefecture_id
    validates :shipping_term_id
  end
end
