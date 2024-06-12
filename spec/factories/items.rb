FactoryBot.define do
  factory :item do
    
    item_name                 {Faker::Lorem.sentence}
    item_explanation          {Faker::Lorem.sentence}
    category_id               {2}
    condition_id              {2}
    contribution_id           {2}
    prefecture_id             {2}
    shipping_day_id           {2}
    price                     {333}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
  end
end
