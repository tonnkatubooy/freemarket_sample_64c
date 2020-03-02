FactoryBot.define do
  
  factory :user do
    nickname              {"test"}
    email                 {"test@.com"}
    password              {"0000000"}
    password_confirmation {"0000000"}
    first_name            {"フリマ"}
    last_name             {"太郎"}
    first_name_kana       {"ふりま"}
    last_name_kana        {"たろう"}
    birthday              {"2020-05-01"}
    phone_number          {"000-0000-0000"}
    introduction          {"自己紹介"}
  end
  
end