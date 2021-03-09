FactoryBot.define do
  factory :pay_form do
    postal_code    {'123-4567'}
    prefecture_id  {3}
    city           {'大田区'}
    street_address {'池上5-23-12'}
    bulding_name   {'ドミール池上305'}
    phone_number   {'08012349876'}
    token          {'asdfghjklsdfghjkl2345678'}
    user_id        {1}
    item_id        {1}
  end
end