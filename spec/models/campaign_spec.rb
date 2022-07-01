require 'rails_helper'

RSpec.describe Campaign, type: :model do
  it { is_expected.to have_many(:investments) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:percentage_raised) }
  it { is_expected.to validate_presence_of(:target_amount) }
  it { is_expected.to validate_presence_of(:sector) }
  it { is_expected.to validate_presence_of(:country) }
  it { is_expected.to validate_presence_of(:investment_multiple) }

  it { is_expected.to validate_numericality_of(:percentage_raised).is_greater_than_or_equal_to(0) }
  it { is_expected.to validate_numericality_of(:target_amount).is_greater_than(0) }
  it { is_expected.to validate_numericality_of(:investment_multiple).is_greater_than(0) }

  describe '#amount_raised' do
    let!(:campaign) { FactoryGirl.create(:campaign) }
    let!(:investment_1) { FactoryGirl.create(:investment, campaign: campaign) }
    let!(:investment_2) { FactoryGirl.create(:investment, campaign: campaign) }

    it 'returns the amount raised through investments' do
      expect(campaign.amount_raised).to eq(investment_1.amount + investment_2.amount)
    end
  end
end