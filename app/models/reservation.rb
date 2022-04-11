class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :user_id, presence: true
  validates :room_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :peoples, presence: true, numericality: {only_integer: true}

  validate :custom_validates

  def custom_validates
    if self.start_date.blank?
      errors.add(:alert, "開始日を選択してください")
    elsif self.end_date.blank?
      errors.add(:alert, "終了日を選択してください")
    elsif self.peoples.blank?
      errors.add(:alert, "人数を選択してください")
    elsif self.start_date < Date.today
      errors.add(:alert, "過去の日付は無効です")
    elsif self.start_date > self.end_date
      errors.add(:alert, "過去の日付は無効です")
    elsif self.start_date == self.end_date
      errors.add(:alert, "開始日より後の日付を選択してください")
    elsif peoples <= 0
      errors.add(:alert, "人数が無効です")
    end
  end
end
