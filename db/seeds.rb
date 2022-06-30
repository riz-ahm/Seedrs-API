image_url = 'http://some-url-to-a-pic.jpg'
sector_list = ['clothing', 'food']
50.times do |iteration|
  sector = iteration % 2 == 0 ? sector_list.first : sector_list.second
  puts "Creating campaign ##{iteration}"
  Campaign.create(
    name: "Campaign ##{iteration}",
    image_url: image_url,
    percentage_raised: 0.0,
    target_amount: iteration * 5000,
    sector: sector,
    country: 'UK',
    investment_multiple: iteration * 250,
  )
end
