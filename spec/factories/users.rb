FactoryBot.define do
  
  factory :user do
    nickname              {"test"}
    email                 {"furima@test.com"}
    password              {"1234567"}
    password_confirmation {"1234567"}
    first_name            {"フリマ"}
    last_name             {"太郎"}
    first_name_kana       {"ふりま"}
    last_name_kana        {"たろう"}
    birthday              {"2020-05-01"}
    phone_number          {"000-1234-5678"}
    introduction          {"自己紹介"}
  end

end