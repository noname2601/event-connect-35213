class Performer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, :name, :name_kana, presence: true
  validates :name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :name_kana, format: {with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/}
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  has_many :introductions
  has_many :messages
  has_many :likes, dependent: :destroy
  has_many :like_introduction, through: :likes, source: :introduction
  has_many :genres
end

