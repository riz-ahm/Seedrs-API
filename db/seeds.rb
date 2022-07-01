image_url = 'http://some-url-to-a-pic.jpg'
sector_list = %w(clothing food)
50.times do |iteration|
  unique_id = iteration + 1
  sector = unique_id % 2 == 0 ? sector_list.first : sector_list.second
  puts "Creating campaign ##{unique_id}"
  Campaign.create(
    name: "Campaign ##{unique_id}",
    image_url: image_url,
    percentage_raised: 0.0,
    target_amount: unique_id * 5000,
    sector: sector,
    country: 'UK',
    investment_multiple: unique_id * 250,
  )
end
