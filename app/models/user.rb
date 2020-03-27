# frozen_string_literal: true

class User < ApplicationRecord
  before_create :downcase_name

  has_many :groups, foreign_key: :creator_id, dependent: :destroy
  has_many :purchases, foreign_key: :author_id, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3, maximum: 20 }

  def downcase_name
    name.downcase!
  end
end
