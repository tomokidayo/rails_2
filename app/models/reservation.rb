class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :check_in_date, presence: true
  validates :check_out_date, presence: true
  validates :people_count, presence: true, numericality: { greater_than_or_equal_to: 1 }

  validate :check_in_after_today
  validate :check_out_after_check_in

  def check_in_after_today
    return if check_in_date.blank?

    if check_in_date < Date.today
      errors.add(:check_in_date, "は本日以降にしてください")
    end
  end

  def check_out_after_check_in
    return if check_in_date.blank? || check_out_date.blank?

    if check_out_date <= check_in_date
      errors.add(:check_out_date, "はチェックイン日より後にしてください")
    end
  end
end
