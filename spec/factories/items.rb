FactoryBot.define do
  factory :item do
    title                {'商品名'}
    description          {'商品の説明あああああああああああああああああああああああ'}
    category_id          {3}
    status_id            {3}
    delivery_cost_id     {3}
    prefecture_id        {3}
    delivery_period_id   {3}
    price                {12345}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
