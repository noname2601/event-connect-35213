require 'rails_helper'

RSpec.describe Performer, type: :model do
  before do
    @performer = FactoryBot.build(:performer)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "全ての項目の入力が存在すれば登録できること" do
        @performer.valid?
        expect(@performer).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
    it 'nicknameが空では登録できない' do
      @performer.nickname = ''
      @performer.valid?
      expect(@performer.errors.full_messages).to include "ニックネームを入力してください"
    end
    it 'emailが空では登録できない' do
      @performer.email = ''
      @performer.valid?
      expect(@performer.errors.full_messages).to include "Eメールを入力してください"
    end
    it "emailに@を含むこと" do
      @performer.email = "test.co.jp"
      @performer.valid?
      expect(@performer.errors.full_messages).to include "Eメールは不正な値です"
    end
    it '重複したemailが存在する場合登録できない' do
      @performer.save
      another_performer = FactoryBot.build(:performer)
      another_performer.email = @performer.email
      another_performer.valid?
      expect(another_performer.errors.full_messages).to include "Eメールはすでに存在します"
    end
    it 'パスワードが空では登録できない' do
      @performer.password = ''
      @performer.valid?
      expect(@performer.errors.full_messages).to include "パスワードを入力してください"
    end
    it 'パスワードは、6文字以上での入力が必須であること' do
      @performer.password = "a0000"
      @performer.password_confirmation = "a0000"
      @performer.valid?
      expect(@performer.errors.full_messages).to include "パスワードは6文字以上で入力してください"
    end
    it "passwordは英数字混合でないと登録できない" do
      @performer.password = "000000"
      @performer.valid?
      expect(@performer.errors.full_messages).to include "パスワードは不正な値です"
    end
    it "passwordは英語のみでは登録できない" do
      @performer.password = "aaaaaaa"
      @performer.valid?
      expect(@performer.errors.full_messages).to include "パスワードは不正な値です"
    end
    it "passwordが全角では登録できないこと" do
    @performer.password = "ａａａａ１１"
    @performer.valid?
    expect(@performer.errors.full_messages).to include "パスワードは不正な値です"
   end
   it "パスワードと確認が一致していないと登録できない" do
    @performer.password = "a111111"
    @performer.password_confirmation = "b111111"
    @performer.valid?
    expect(@performer.errors.full_messages).to include "Password confirmationとパスワードの入力が一致しません"
  end
    it '名前が空では登録できない' do
      @performer.name = ''
      @performer.valid?
      expect(@performer.errors.full_messages).to include "名前を入力してください"
    end
    it '名前が漢字・平仮名・カタカナ以外では登録できないこと' do
      @performer.name = "aa"
      @performer.valid?
      expect(@performer.errors.full_messages).to include "名前は不正な値です"
   end
    it '名前（カナヨミ）が空では登録できない' do
      @performer.name_kana = ''
      @performer.valid?
      expect(@performer.errors.full_messages).to include "名前（カナヨミ）を入力してください"
    end
    it '名前（カナヨミ）がカタカナ以外では登録できないこと' do
      @performer.name_kana = "じろう"
      @performer.valid?
      expect(@performer.errors.full_messages).to include("名前（カナヨミ）は不正な値です")
    end
  end
 end
end