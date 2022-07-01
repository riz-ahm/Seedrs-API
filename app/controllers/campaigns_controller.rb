class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.order(id: :asc)
    @campaigns = Queries::Filter::Campaign.call(relation: @campaigns, params: params)
    @campaigns = Queries::Paginate.call(relation: @campaigns, params: params)
  end
end
