require 'rails_helper'

RSpec.describe PurchaseDestination, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @purchase_destination = FactoryBot.build(:purchase_destination, item_id: @item.id, user_id: @user.id)
  end
  describe '商品購入機能' do
    context '商品の購入ができる場合' do
      it '適切な入力で商品が購入できる' do
        expect(@purchase_destination).to be_valid
      end
      it 'buildingは空でも商品が購入できる' do
        @purchase_destination.building = ''
        expect(@purchase_destination).to be_valid
      end
    end
    context '商品の購入ができない場合' do
      it 'tokenが空では購入できない' do
        @purchase_destination.token = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Token can't be blank")
      end
      it 'region_idが---では購入できない' do
        @purchase_destination.region_id = '1'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Region can't be blank")
      end
      it 'cityが空では購入できない' do
        @purchase_destination.city = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("City can't be blank")
      end
      it 'street_addressが空では購入できない' do
        @purchase_destination.street_address = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Street address can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @purchase_destination.phone_number = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが9桁以下では購入できない' do
        @purchase_destination.phone_number = '123456789'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number is invalid. Include hyphen(-)")
      end
      it 'phone_numberが12桁以上では購入できない' do
        @purchase_destination.phone_number = '123456789012'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number is invalid. Include hyphen(-)")
      end
      it 'phone_numberが半角数値以外では購入できない' do
        @purchase_destination.phone_number = '１２３４５６７８９０'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number is invalid. Include hyphen(-)")
      end
      it 'user_idが空では購入できない' do
        @purchase_destination.user_id = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では購入できない' do
        @purchase_destination.item_id = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
