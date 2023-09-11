FactoryBot.define do
  factory :purchase_destination do
    post_code             { '123-4567' }
    region_id             { 2 }
    city                  { 'test' }
    street_address        { 'test' }
    building              { 'test' }
    phone_number          { 1234567890 }
    token {"tok_abcdefghijk00000000000000000"}
  
  end
end