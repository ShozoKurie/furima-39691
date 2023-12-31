FactoryBot.define do
  factory :item do
    item_name                         { 'テスト' }
    caption                           { 'テスト' }
    category_id                       { '2' }
    condition_id                      { '2' }
    postage_id                        { '2' }
    region_id                         { '2' }
    days_to_ship_id                   { '2' }
    price                             { '500' }
    association :user
    
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
