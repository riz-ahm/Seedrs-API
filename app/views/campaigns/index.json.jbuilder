json.campaigns @campaigns do |campaign|
  json.id campaign.id
  json.name campaign.name
  json.image campaign.image_url
  json.percentage_raised campaign.percentage_raised
  json.target_amount campaign.target_amount
  json.sector campaign.sector
  json.country campaign.country
  json.investment_multiple campaign.investment_multiple
end

json.pagination do
  json.total_pages @campaigns.total_pages
  json.total_count @campaigns.total_count
  json.current_page @campaigns.current_page
end