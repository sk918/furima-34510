FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'aiu123'}
    password_confirmation {password}
    family_name           {'亜あア'}
    first_name            {'亜あア'}
    family_name_kana      {'アイウ'}
    first_name_kana       {'アイウ'}
    birth_date            {'2000-01-01'}
  end
end