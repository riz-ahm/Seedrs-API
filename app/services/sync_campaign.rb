class SyncCampaign
  def self.call(campaign)
    new(campaign).call
  end

  attr_reader :campaign

  def initialize(campaign)
    @campaign = campaign
  end

  def call
    stored_percentage_raised = campaign.percentage_raised
    current_percentage_raised = calculate_current_percentage_raised

    unless stored_percentage_raised == current_percentage_raised
      campaign.percentage_raised = current_percentage_raised
      campaign.save!
    end
  end

  private

  def calculate_current_percentage_raised
    campaign.amount_raised * (100 / campaign.target_amount)
  end
end
