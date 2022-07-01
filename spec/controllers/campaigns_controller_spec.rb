require 'rails_helper'

RSpec.describe CampaignsController, type: :controller do
  let!(:campaign_1) { FactoryGirl.create(:campaign, country: 'US', target_amount: 2000) }
  let!(:investment) { FactoryGirl.create(:investment, campaign: campaign_1) }
  let!(:campaign_2) { FactoryGirl.create(:campaign, sector: 'food') }

  describe '#index' do
    render_views

    it 'exposes the json of campaigns list' do
      get :index, params: { format: :json }
      expect(JSON.parse(response.body)).to eq(
        'campaigns' => [
          {
            'id' => campaign_1.id,
            'name' => campaign_1.name,
            'image' => campaign_1.image_url,
            'percentage_raised' => campaign_1.percentage_raised.to_s,
            'target_amount' => campaign_1.target_amount.to_s,
            'sector' => campaign_1.sector,
            'country' => campaign_1.country,
            'investment_multiple' => campaign_1.investment_multiple.to_s,
          },
          {
            'id' => campaign_2.id,
            'name' => campaign_2.name,
            'image' => campaign_2.image_url,
            'percentage_raised' => campaign_2.percentage_raised.to_s,
            'target_amount' => campaign_2.target_amount.to_s,
            'sector' => campaign_2.sector,
            'country' => campaign_2.country,
            'investment_multiple' => campaign_2.investment_multiple.to_s,
          }
        ],
        'pagination' => {
          'total_pages' => 1,
          'total_count' => 2,
          'current_page' => 1,
        },
      )
    end

    context 'with filtering params' do
      context 'filtering by sector' do
        it 'exposes the json of campaigns list' do
          get :index, params: { format: :json, sectors: ['food'] }
          expect(JSON.parse(response.body)).to eq(
            'campaigns' => [
              {
                'id' => campaign_2.id,
                'name' => campaign_2.name,
                'image' => campaign_2.image_url,
                'percentage_raised' => campaign_2.percentage_raised.to_s,
                'target_amount' => campaign_2.target_amount.to_s,
                'sector' => campaign_2.sector,
                'country' => campaign_2.country,
                'investment_multiple' => campaign_2.investment_multiple.to_s,
              }
            ],
            'pagination' => {
              'total_pages' => 1,
              'total_count' => 1,
              'current_page' => 1,
            },
          )
        end
      end

      context 'filtering by country' do
        it 'exposes the json of campaigns list' do
          get :index, params: { format: :json, countries: ['US'] }
          expect(JSON.parse(response.body)).to eq(
            'campaigns' => [
              {
                'id' => campaign_1.id,
                'name' => campaign_1.name,
                'image' => campaign_1.image_url,
                'percentage_raised' => campaign_1.percentage_raised.to_s,
                'target_amount' => campaign_1.target_amount.to_s,
                'sector' => campaign_1.sector,
                'country' => campaign_1.country,
                'investment_multiple' => campaign_1.investment_multiple.to_s,
              }
            ],
            'pagination' => {
              'total_pages' => 1,
              'total_count' => 1,
              'current_page' => 1,
            },
          )
        end
      end

      context 'filtering by target amount' do
        it 'exposes the json of campaigns list' do
          get :index, params: { format: :json, target_amount_min: 1000, target_amount_max: 2500 }
          expect(JSON.parse(response.body)).to eq(
            'campaigns' => [
              {
                'id' => campaign_1.id,
                'name' => campaign_1.name,
                'image' => campaign_1.image_url,
                'percentage_raised' => campaign_1.percentage_raised.to_s,
                'target_amount' => campaign_1.target_amount.to_s,
                'sector' => campaign_1.sector,
                'country' => campaign_1.country,
                'investment_multiple' => campaign_1.investment_multiple.to_s,
              }
            ],
            'pagination' => {
              'total_pages' => 1,
              'total_count' => 1,
              'current_page' => 1,
            },
          )
        end
      end

      context 'filtering by min investor count' do
        it 'exposes the json of campaigns list' do
          get :index, params: { format: :json, investor_count_min: 1 }
          expect(JSON.parse(response.body)).to eq(
            'campaigns' => [
              {
                'id' => campaign_1.id,
                'name' => campaign_1.name,
                'image' => campaign_1.image_url,
                'percentage_raised' => campaign_1.percentage_raised.to_s,
                'target_amount' => campaign_1.target_amount.to_s,
                'sector' => campaign_1.sector,
                'country' => campaign_1.country,
                'investment_multiple' => campaign_1.investment_multiple.to_s,
              }
            ],
            'pagination' => {
              'total_pages' => 1,
              'total_count' => 1,
              'current_page' => 1,
            },
          )
        end
      end
    end
  end
end
