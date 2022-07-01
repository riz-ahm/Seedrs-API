require 'rails_helper'

RSpec.describe Investment, type: :model do
  it { is_expected.to belong_to(:campaign) }
  it { is_expected.to validate_presence_of(:investor_name) }
  it { is_expected.to validate_presence_of(:amount) }
  it { is_expected.to validate_presence_of(:campaign) }

  it { is_expected.to validate_numericality_of(:amount).is_greater_than(0) }

  describe 'amount_is_multiple_of_investment_multiple' do
    let!(:campaign) { FactoryGirl.create(:campaign, investment_multiple: 5) }
    let!(:investment) { FactoryGirl.build(:investment, campaign: campaign, amount: 911) }
    let!(:error_string) do
      'The investment multiple for the selected campaign is GBP 5.0 .'\
      ' You can only invest GBP 5.0, GBP 10.0 and so on.'
    end

    it 'validates if investment amount is multiple of campaigns investment multiple' do
      expect(investment.valid?).to eq(false)
      expect(investment.errors.messages).to eq(amount: [error_string])
    end
  end

  describe 'sync_campaign_attributes' do
    let!(:campaign) { FactoryGirl.create(:campaign, investment_multiple: 5, target_amount: 100) }
    let!(:investment) { FactoryGirl.build(:investment, campaign: campaign, amount: 50) }


    it 'updates the percentage raised of campaign after investment is saved' do
      expect(investment.valid?).to eq(true)
      expect(campaign.percentage_raised).to eq(0)
      expect(investment.save).to eq(true)
      expect(campaign.percentage_raised).to eq(50)
    end
  end
end