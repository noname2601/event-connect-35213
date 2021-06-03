class Message < ApplicationRecord
  belongs_to :introduction
  validates :text, presence: true
end
