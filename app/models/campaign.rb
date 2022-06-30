class Campaign < ApplicationRecord
  has_many :investments, dependent: :destroy

  validates :name, presence: true
  validates :percentage_raised, presence: true, numericality: { greater_than: 0 }
  validates :target_amount, presence: true, numericality: { greater_than: 0 }
  validates :sector, presence: true
  validates :country, presence: true
  validates :investment_multiple, presence: true, numericality: { greater_than: 0 }
end
