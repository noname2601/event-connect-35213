require 'rails_helper'

RSpec.describe Introduction, type: :model do
  before do
    @introduction = FactoryBot.build(:introduction)
end

describe "プロフィール投稿機能" do

  context "プロフィールが投稿できるとき" do
    it "プロフィール投稿が全て入力済みであること" do
      expect(@introduction).to be_valid
    end
  end

  context "プロフィールが投稿できないとき" do
    it "プロフィール画像を1枚つけることが必須であること" do
      @introduction.image = nil
      @introduction.valid?
      expect(@introduction.errors.full_messages).to include("画像を入力してください")
    end
    it "スキルが必須であること" do
      @introduction.skill = ""
      @introduction.valid?
      expect(@introduction.errors.full_messages).to include("スキルを入力してください")
    end
    it "説明が必須であること" do
      @introduction.description = ""
      @introduction.valid?
      expect(@introduction.errors.full_messages).to include("特技の説明を入力してください")
    end
    it "ツイッターアカウントが必須であること" do
      @introduction.twitter_id = ""
      @introduction.valid?
      expect(@introduction.errors.full_messages).to include("ツイッターIDを入力してください")
    end
  end
 end
end

    
