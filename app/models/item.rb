class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :region
  belongs_to :category
  has_one :condition
  has_one_attached :image
  belongs_to :user


  validates :item_name, presence: true
  validates :caption, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :postage_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :region_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :days_to_ship_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true,numericality: { in: 300..9999999, message: "must be in 300~9999999 by Single-byte numeric value" } 
  validates :user, presence: true
  validates :image, presence: true  


end
