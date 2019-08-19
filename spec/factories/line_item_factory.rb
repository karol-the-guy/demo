FactoryBot.define do
  factory :line_item do
    sequence(:name) { |n| "Awesome lineitem #{n}" }
    unformatted_price { 1000 }
    quantity { 10 }
    sequence(:description) { |n| "Awesome lineitem #{n}" }
  end
end
