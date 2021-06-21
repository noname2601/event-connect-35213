class Introduction < ApplicationRecord
  belongs_to :performer
  has_many :messages, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_performers, through: :likes, source: :performer
  has_one_attached :image

  validates :skill, presence: true
  validates :description, presence: true
  validates :twitter_id, presence: true
  validates :image, presence: true

  def self.search(search)
    if search != ""
      Introduction.where('skill LIKE(?)', "%#{search}%")
    else
      Introduction.all
    end
  end

  def liked_by?(performer)
    likes.where(performer_id: performer.id).exists?
  end
end
