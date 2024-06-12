class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_explanation
    validates :price
  end

  with_options numericality: { other_than: 1, message: "can't be blank"} do
    validates :category_id
    validates :condition_id
    validates :contribution_id
    validates :prefecture_id
    validates :shipping_day_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :contribution
  belongs_to :prefecture
  belongs_to :shipping_day

  validates :price, numericality:{ with: /\A[0-9]+\z/, message: 'should be half-width numbers' }
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
end