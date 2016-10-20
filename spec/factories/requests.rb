FactoryGirl.define do
  factory :request do
    customer_name 'customer name'
    customer_email 'john@example.com'
    project_name 'project name'
    feature_name 'feature name'
    uid Faker::Crypto.md5
  end
end
