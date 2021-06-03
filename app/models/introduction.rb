class Introduction < ApplicationRecord
  belongs_to :performer
  has_many :messages
  has_one_attached :image

  validates :skill, presence: true
  validates :description, presence: true
  validates :day_price, presence: true
  validates :image, presence: true

  def self.search(search)
    if search != ""
      Introduction.where('skill LIKE(?)', "%#{search}%")
    else
      Introduction.all
    end
  end
end
