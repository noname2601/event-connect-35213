require 'rails_helper'

RSpec.describe Performer, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      performer = FactoryBot.build(:performer)
      performer.nickname = ''
      performer.valid?
      expect(performer.errors.full_messages).to include "ニックネームを入力してください"
    end
    it 'emailが空では登録できない' do
      performer = FactoryBot.build(:performer)
      performer.email = ''
      performer.valid?
      expect(performer.errors.full_messages).to include "Eメールを入力してください"
    end
    it 'パスワードが空では登録できない' do
      performer = FactoryBot.build(:performer)
      performer.password = ''
      performer.valid?
      expect(performer.errors.full_messages).to include "パスワードを入力してください"
    end
    it '名前が空では登録できない' do
      performer = FactoryBot.build(:performer)
      performer.name = ''
      performer.valid?
      expect(performer.errors.full_messages).to include "名前を入力してください"
    end
    it '名前（カナヨミ）が空では登録できない' do
      performer = FactoryBot.build(:performer)
      performer.name_kana = ''
      performer.valid?
      expect(performer.errors.full_messages).to include "名前（カナヨミ）を入力してください"
    end
    

  end
end