class Group < ApplicationRecord
  # after_create :upload_icon
  # after_save :edit_icon
  belongs_to :creator, foreign_key: :creator_id, class_name: "User"
  has_many :purchases, dependent: :destroy

  validates :name, presence: true, length: {minimum:3, maximum:15}
  validates :icon, presence: true
  # mount_uploader :icon, IconUploader

  # def upload_icon
  #   byebug
  #   Cloudinary::Uploader.upload(Group.last.icon.identifier)
  # end

  # def edit_icon
  #   group = Group.last
  #   group.icon.url = @value['url']
  #   group.save
  # end
end