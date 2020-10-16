FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              { '1a' + Faker::Internet.password(min_length: 7, max_length: 20) }
    password_confirmation {password}
    # 誕生日は一意性ではないよ
    birth_date            {"19871221"}
    # { Faker::Date.between_except(from: 20.year.ago, to: 1.year.from_now, excepted: Date.today) }
    first_name            {"荘林"}
    last_name             {"憲人"}
    first_name_kana       {"ソウバヤシ"}
    last_name_kana        {"ケント"}
  end
end