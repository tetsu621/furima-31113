FactoryBot.define do
  factory :product do
    title {"sample"}
    explanation {"sample"}
    category_id {2}
    status_id {2}
    delivery_fee_id {2}
    area_id {2}
    day_id {2}
    price {400}
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
