class Group < ApplicationRecord
  validates :name, presence: true, on: :create

  has_many :members
  has_many :users, through: :members
  has_many :messages, foreign_key: "group_id"
end
