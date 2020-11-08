FactoryBot.define do
  factory :user do
    nickname {"sample"}
    email {"tanaka@tanaka.com"}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name {"太郎"}
    last_name {"田中"}
    first_name_kana {"タロウ"}
    last_name_kana {"タナカ"}
    birthday {"1999-09-09"}
  end
end