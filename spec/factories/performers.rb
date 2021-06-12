FactoryBot.define do
  factory :performer do
    nickname              {'test'}
    email                 {'test@test.com'}
    password              {'000000'}
    password_confirmation {password}
    name                  {'佐藤次郎'}
    name_kana             {'サトウジロウ'}
  end
end
