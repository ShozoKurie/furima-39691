FactoryBot.define do
  factory :user do
    nickname                   { 'test' }
    email                      { 'test@example' }
    password                   { 'aaa000' }
    password_confirmation      { password }
    last_name                  { 'テスト' }
    first_name                 { 'テスト' }
    last_name_kana             { 'テスト' }
    first_name_kana            { 'テスト' }
    birthday                   { '1989-01-24' }
  end
end
