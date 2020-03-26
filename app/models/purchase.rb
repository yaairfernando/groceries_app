class Purchase < ApplicationRecord
  belongs_to :creator, foreign_key: :author_id, class_name: "User"
  belongs_to :group, optional: true

  validates :name, presence: true, length: {minimum:3, maximum:30}
  validates :amount, presence: true
end
