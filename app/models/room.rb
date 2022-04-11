class Room < ApplicationRecord
  belongs_to :user
  has_many :reservation
  has_many :users, through: :reservation

  validates :name, presence: true, length: {maximum: 30}
  validates :introduce, presence: true, length: {maximum: 200}
  validates :price, presence: true, numericality: {only_integer: true}
  validates :address, presence: true, length: {maximum: 10}
  validates :image_name, presence: true, length: {maximum: 20}
end
