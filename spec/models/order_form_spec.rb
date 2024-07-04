require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @orderform = FactoryBot.build(:order_form)
  end

  describe '購入機能' do
    context '保存できる時' do
      it 'すべての情報が存在すれば保存できる' do
        expect(@orderform).to be_valid
      end
      it 'building_nameの情報がなくても保存できる' do
        @orderform.building_name = ''
        expect(@orderform).to be_valid
      end
    end
    context '保存できない時' do
      it 'user_idが空では登録できない' do
        @orderform.user_id = nil
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では登録できない' do
        @orderform.item_id = nil
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Item can't be blank")
      end
      it 'post_cordが空では登録できない' do
        @orderform.post_cord = ''
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Post cord can't be blank", "Post cord is invalid. Include hyphen(-)")
      end
      it 'post_cordが「3桁ハイフン4桁」の全角文字列では登録できない' do
        @orderform.post_cord = '１１１-１１１１'
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Post cord is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが未選択では登録できない' do
        @orderform.prefecture_id = '1'
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalitiesが空では登録できない' do
        @orderform.municipalities = ''
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空では登録できない' do
        @orderform.address = ''
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では登録できない' do
        @orderform.phone_number = ''
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end
      it 'phone_numberが10桁以下の全角数値では登録できない' do
        @orderform.phone_number = '００００００００００'
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが12桁以上の全角数値では登録できない' do
        @orderform.phone_number = '００００００００００００'
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが11桁の全角数値では登録できない' do
        @orderform.phone_number = '０００００００００００'
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Phone number is invalid")
      end
      it 'tokenが空では登録できない' do
        @orderform.token = nil
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Token can't be blank")
      end
    end
  end 
end