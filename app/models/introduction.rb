class Introduction < ApplicationRecord
  belongs_to :performer
  belongs_to :user
  has_one_attached :image

  validates :skill, presence: true
  validates :description, presence: true
  validates :day_price, presence: true
  validates :image, presence: true
end
