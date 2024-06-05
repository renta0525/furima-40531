FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 3)}
    email                 {Faker::Internet.email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {'山田'}
    last_name             {'太郎'}
    first_name_read       {'ヤマダ'}
    last_name_read        {'タロウ'}
    birthday              {Faker::Date.birthday}
  end
end