FactoryGirl.define do
  factory :style do
    title '2013 Winter Shirt'
    price 39.99
    current_price 19.99
    # Wow! Google sells shirt?
    url 'http://google.com'
  end
end