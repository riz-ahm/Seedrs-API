class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.order(id: :asc)
    @campaigns = Queries::Paginate.call(relation: @campaigns, params: params)
  end
end
