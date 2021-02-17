require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
   context '新規登録できるとき' do
    it 'nickname,email,password,password_confirmation,first_name,first_name_hurigana,last_name,last_name_hurigana,dateがあると登録できる' do
       expect(@user).to be_valid
    end
    # it'passwordは英数字の混合であれば登録できる'do
    #    @user.password = 's111111'
    #    expect(@user).to be_valid
    # end
    # it'first_nameは漢字であれば登録できる'do
    #    @user.first_name = '山田'
    #    expect(@user).to be_valid
    # end
    # it'first_name_huriganaは全角カタカナであれば登録できる'do
    #    @user.first_name_hurigana = 'ヤマダ'
    #    expect(@user).to be_valid
    # end
    # it'last_nameは漢字であれば登録できる'do
    #    @user.last_name = '太朗'
    #    expect(@user).to be_valid
    # end
    #  it'last_name_huriganaは全角カタカナであれば登録できる'do
    #    @user.last_name_hurigana = 'タロウ'
    #    expect(@user).to be_valid
    # end
  end
  context '新規登録できないとき' do
    it'nicknameが空では登録できない'do
     @user.nickname = ''
     @user.valid?
    expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it'emilが空では登録できない'do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it'passwordが空では登録できない'do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it'passwordが存在してもpassword_confirmationが空では登録できない'do
      @user.password_confirmation = ''
      @user.valid? 
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
   end
    it'first_nameが空では登録できない'do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it'first_name_huriganaが空では登録できない'do
      @user.first_name_hurigana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name hurigana can't be blank")
    end
    it 'last_nameが空では登録できない'do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end  
    it 'last_name_huriganaが空では登録できない'do
      @user.last_name_hurigana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name hurigana can't be blank")
    end  
    it 'dateが空では登録できない'do
      @user.date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Date can't be blank")
    end  
   end
 end
end

