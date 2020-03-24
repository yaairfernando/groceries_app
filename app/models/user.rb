class User < ApplicationRecord
  has_many :groups, foreign_key: :creator_id
  has_many :purchases, foreign_key: :author_id

  validates :name, presence: true, length: {minimum:3, maximum:20}
end
