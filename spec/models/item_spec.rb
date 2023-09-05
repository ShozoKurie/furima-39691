require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品機能' do
    context '商品出品ができない場合' do
      it '商品名が空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品説明が空では登録できない' do
        @item.caption = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Caption can't be blank")
      end
      it 'カテゴリーが---では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が---では登録できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料の負担が---では登録できない' do
        @item.postage_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end
      it '発送元の地域が---では登録できない' do
        @item.region_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Region can't be blank")
      end
      it '発送までの日数が---では登録できない' do
        @item.days_to_ship_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end
      it '価格が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が300円未満では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be in 300~9999999 by Single-byte numeric value")
      end
      it '価格が9,999,999円を超えると出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be in 300~9999999 by Single-byte numeric value")
      end
      it '価格が半角数値以外では登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be in 300~9999999 by Single-byte numeric value")
      end
      it '画像の添付なしでは登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
    context '商品出品ができる場合' do
      it '適切な入力で商品を登録できる' do
        expect(@item).to be_valid
      end
    end
  end
end
