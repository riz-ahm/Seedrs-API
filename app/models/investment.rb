class Investment < ApplicationRecord
  belongs_to :campaign

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :investor_name, presence: true
  validates :campaign, presence: true
end
