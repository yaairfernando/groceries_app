class Group < ApplicationRecord
  belongs_to :creator, foreign_key: :creator_id, class_name: "User"
  has_many :purchases, dependent: :destroy

  validates :name, presence: true, length: {minimum:3, maximum:15}
  validates :icon, presence: true
  # mount_uploader :icon, IconUploader
end