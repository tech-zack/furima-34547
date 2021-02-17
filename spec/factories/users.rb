FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'s111111'}
    password_confirmation  {password}
    first_name_hurigana   {'ヤマダ'}
    first_name            {'山田'}
    last_name_hurigana    {'タロウ'}
    last_name             {'太朗'}
    date                  {'2020/01/01'}
  end
end