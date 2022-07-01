class Investment < ApplicationRecord
  belongs_to :campaign

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :investor_name, presence: true
  validates :campaign, presence: true

  validate :amount_is_multiple_of_investment_multiple

  after_save :sync_campaign_attributes

  private

  def amount_is_multiple_of_investment_multiple
    return unless campaign

    return if amount % campaign.investment_multiple == 0

    errors.add(
      :amount,
      I18n.t(
        'validation_messages.investment.amount',
        investment_multiple: campaign.investment_multiple,
        example_amount: campaign.investment_multiple * 2,
      ),
    )
  end

  def sync_campaign_attributes
    SyncCampaign.call(campaign)
  end
end
