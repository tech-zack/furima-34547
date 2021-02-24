require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @order = FactoryBot.build(:order_address,user_id: @user.id,item_id: @item.id)
    sleep(1)
  end

  describe '商品購入' do
  context '商品出品できるとき' do
    it '全ての情報があると入力できる' do
      expect(@order).to be_valid
    end
    it '建物名がなくても入力できる' do
      @order.building  = ""
      expect(@order).to be_valid
    end
  end

  context '商品購入できないとき' do
    it 'cityが空では保存できないこと' do
      @order.city = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end
  it 'addressが空では保存できないこと' do
    @order.address = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Address can't be blank")
  end
  it 'postal_codeが空では保存できないこと' do
    @order.postal_code = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
  end
  it 'phone_numberが空では保存できないこと' do
    @order.phone_number= nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Phone number is invalid")
  end
  it 'delivery_source_idが空では保存できないこと' do
    @order.delivery_source_id = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Delivery source is not a number")
  end
  it 'delivery_source_idが1では保存できないこと' do
    @order.delivery_source_id = 1
    @order.valid?
    expect(@order.errors.full_messages).to include("Delivery source must be other than 1")
  end
  it 'postal_codeには-がないと保存できないこと' do
    @order.postal_code = 1234567
    @order.valid?
    expect(@order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
  end
  it 'phone_munberは12桁以上では保存できないこと' do
    @order.phone_number = 000000000000
    @order.valid?
    expect(@order.errors.full_messages).to include("Phone number is invalid")
  end
  it 'phone_munberは英数混合では保存できないこと' do
    @order.phone_number = 's1111111111'
    @order.valid?
    expect(@order.errors.full_messages).to include("Phone number is invalid")
  end
  it "tokenが空では登録できないこと" do
    @order.token = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Token can't be blank")
  end
  it "user_idが空では登録できないこと" do
    @order.user_id = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("User can't be blank")
  end
  it "item_idが空では登録できないこと" do
    @order.item_id = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Item can't be blank")
  end
 end

end
end
