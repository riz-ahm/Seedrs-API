require 'rails_helper'

RSpec.describe InvestmentsController, type: :controller do
  let!(:campaign) { FactoryGirl.create(:campaign, investment_multiple: 25) }

  describe '#create' do
    context 'with valid parameters' do
      let!(:valid_params) do
        {
          amount: 75,
          investor_name: 'John Doe',
          campaign_id: campaign.id,
        }
      end

      it 'creates an investment' do
        expect { post :create, params: { investment: valid_params } }.
          to change(Investment, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      let!(:invalid_params) do
        {
          amount: 75,
          investor_name: '',
          campaign_id: campaign.id,
        }
      end

      it 'creates an investment' do
        expect { post :create, params: { investment: invalid_params } }.
          not_to change(Investment, :count)
      end
    end
  end
end
