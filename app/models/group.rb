class Group < ApplicationRecord
  has_many :members
  has_many :users ,through: :members
  has_many :chats
  validates :name, presence: true
end
