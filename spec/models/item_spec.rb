require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規商品出品' do
    context '商品出品ができる場合' do
      it '全ての項目の入力が存在していれば保存できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品ができない場合' do
      it '商品名がないと保存できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      # price
      it '価格がないと保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が¥300未満では保存できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格が¥9,999,999を超えると保存できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '価格が全角数値では保存できない' do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      # //price
      it '商品の説明がないと保存できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end
      # category
      it 'カテゴリーがないと保存できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category を入力してください")
      end
      # condition
      it '商品の状態がないと保存できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '商品の状態に「---」が選択されている場合は出品できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition を入力してください")
      end
      # shipping_option
      it '配送料の負担がないと保存できない' do
        @item.shipping_option_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping option can't be blank")
      end
      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @item.shipping_option_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping option を入力してください")
      end
      # prefecture
      it '発送元の地域がないと保存できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture を入力してください")
      end
      # shipping_term
      it '発送までの日数がないと保存できない' do
        @item.shipping_term_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping term can't be blank")
      end
      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @item.shipping_term_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping term を入力してください")
      end
      it 'ユーザー情報が紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it ' 商品画像がないと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
