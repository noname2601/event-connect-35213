class Message < ApplicationRecord
  belongs_to :introduction
  belongs_to :performer
  validates :text, presence: true
end
