require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
  context '商品出品できるとき' do
    it 'title,description,category_id,status_id,delivery_fee_id,delivery_source_id,delivery_date_id,product_price,imageが存在していれば保存できること' do
      expect(@item).to be_valid
    end
  end

  context '商品出品できないとき' do
    it 'titleが空では保存できないこと' do
      @item.title = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")
    end
  it 'imageが空では保存できないこと' do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
  end
  it 'descriptionが空では保存できないこと' do
    @item.description = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Description can't be blank")
  end
  it 'category_idが空では保存できないこと' do
    @item.category_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Category is not a number")
  end
  it 'status_idが空では保存できないこと' do
    @item.status_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Status is not a number")
  end
  it 'delivery_fee_idが空では保存できないこと' do
    @item.delivery_fee_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Delivery fee is not a number")
  end
  it 'delivery_source_idが空では保存できないこと' do
    @item.delivery_source_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Delivery source is not a number")
  end
  it 'delivery_date_idが空では保存できないこと' do
    @item.delivery_date_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Delivery date is not a number")
  end
  it 'product_priceが空では保存できないこと' do
    @item.product_price = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Product price is invalid")
  end
  it 'category_idが1では保存できないこと' do
    @item.category_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Category must be other than 1")
  end
  it 'status_idが1では保存できないこと' do
    @item.status_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Status must be other than 1")
  end
  it 'delivery_fee_idが1では保存できないこと' do
    @item.delivery_fee_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
  end
  it 'delivery_source_idが1では保存できないこと' do
    @item.delivery_source_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Delivery source must be other than 1")
  end
  it 'delivery_date_idが1では保存できないこと' do
    @item.delivery_date_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Delivery date must be other than 1")
  end
  it 'product_priceが全角文字では保存できないこと' do
    @item.product_price = "１００００"
    @item.valid?
    expect(@item.errors.full_messages).to include("Product price is not a number")
  end
  it 'product_priceが299円以下では保存できないこと' do
    @item.product_price = 299
    @item.valid?
    expect(@item.errors.full_messages).to include("Product price must be greater than 299")
  end
  it 'product_priceが10,000,000以上では保存できないこと' do
    @item.product_price = 10000000
    @item.valid?
    expect(@item.errors.full_messages).to include("Product price must be less than 10000000")
  end
  it 'product_priceが半角英数混合では保存できないこと' do
    @item.product_price = "a10000"
    @item.valid?
    expect(@item.errors.full_messages).to include("Product price is not a number")
  end
  it 'product_priceが半角英語では保存できないこと' do
    @item.product_price = "aaaaa"
    @item.valid?
    expect(@item.errors.full_messages).to include("Product price is not a number")
  end

end
end
end
  