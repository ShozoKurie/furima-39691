class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :region


  validates :item_name, presence: true
  validates :caption, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :postage_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :region_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :days_to_ship_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true,numericality: { greater_than_or_equal_to: 300}
  validates :user, presence: true


end
