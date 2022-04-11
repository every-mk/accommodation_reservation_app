class Profile < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: {maximum: 30}
  validates :image_name, presence: true, length: {maximum: 20}
  validates :introduce, presence: true, length: {maximum: 200}, on: :update
  validates :user_id, uniqueness: true
end
