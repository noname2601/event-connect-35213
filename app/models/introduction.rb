class Introduction < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions 
  belongs_to :performer
  belongs_to :genre
  has_many :messages, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_performers, through: :likes, source: :performer
  has_one_attached :image

  with_options presence: true do
   validates :genre_id, numericality: { other_than: 1 }
   validates :description
   validates :twitter_id
   validates :image
  end

  def liked_by?(performer)
    likes.where(performer_id: performer.id).exists?
  end
end
