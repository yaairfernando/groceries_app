class Group < ApplicationRecord
  belongs_to :creator, foreign_key: :creator_id, class_name: "User"
  has_many :purchases

  validates :name, presence: true, length: {minimum:3, maximum:15}
  validates :icon, presence: true
end