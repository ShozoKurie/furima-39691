class PurchaseDestination
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :purchase_id, :post_code, :region_id, :city, :street_address, :building, :phone_number, :token

  with_options presence: true do
    validates :post_code
    validates :city
    validates :street_address
    validates :phone_number
    validates :token
  end
  validates :region_id, numericality: { other_than: 1 , message: "can't be blank"}

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Destination.create(post_code: post_code, region_id: region_id, city: city, street_address: street_address, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end