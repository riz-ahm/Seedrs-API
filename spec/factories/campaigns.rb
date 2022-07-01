FactoryGirl.define do
  factory :campaign do
    name 'Basic campaign'
    image_url 'http://some-image.jpg'
    percentage_raised 0
    target_amount 5000
    sector 'home'
    country 'UK'
    investment_multiple 50
  end
end
