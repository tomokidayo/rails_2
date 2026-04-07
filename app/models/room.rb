class Room < ApplicationRecord
  PRICE_MIN = 1

  belongs_to :user
  has_many :reservations
  has_one_attached :image

  def index
    @rooms = current_user.rooms
  end

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: PRICE_MIN }
  validates :address, presence: true

  # 検索機能
  # LIKE検索 + scope化
  # キーワードが存在する場合のみ、addressカラムに対してLIKE検索を行うスコープ
  scope :area_search, ->(area) {
    # binding.break
    where("address LIKE ?", "%#{area}%") if area.present?
  }

  scope :keyword_search, ->(keyword) {
    where("name LIKE ? OR description LIKE ?", "%#{keyword}%", "%#{keyword}%") if keyword.present?
  }
end
