require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nicknameが空だと登録ができない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空だと登録ができない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "メールアドレスは、@がないと登録ができないこと" do
      @user.email = "tanaka.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "passwordが空だと登録ができない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが5文字以下だと登録ができない" do
      @user.password = "tanak"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordが英字のみでは登録ができない登録ができない" do
      @user.password = "tanaka"
      @user.password_confirmation = "tanaka"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "passwordが数字のみでは登録ができない" do
      @user.password = "111111"
      @user.password_confirmation = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    

    it "passwordとencrypted_passwordが一致しない場合は登録できないこと" do
      @user.password = "tanaka1"
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "ユーザー本名は名字がないと登録ができないこと" do
      @user.last_name = "太郎"
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "ユーザー本名は名前がないと登録ができないこと" do
      @user.last_name = ""
      @user.first_name = "田中"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "名字は全角出ないと登録ができないこと" do
      @user.last_name = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
    end

    it "名前は全角出ないと登録ができないこと" do
      @user.first_name = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
    end

    it "ユーザー本名のフリガナは名字がないと登録ができないこと" do
      @user.last_name_kana = "タロウ"
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "ユーザー本名のフリガナは名前がないと登録ができないこと" do
      @user.last_name_kana = ""
      @user.first_name_kana = "タナカ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it "ユーザー本名の名字のフリガナは全角出ないと登録ができないこと" do
      @user.last_name = "ﾀﾅｶ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
    end

    it "ユーザー本名の名前のフリガナは全角出ないと登録ができないこと" do
      @user.first_name = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
    end

    it "birthdayが空だと登録ができない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

  end
end
