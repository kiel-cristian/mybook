FactoryGirl.define do |f|
  factory :item do
    itemable_id 10
    itemable_type "Book"
    token SecureRandom.hex(10).to_s

    cart_id { create(:cart).id }
  end
end