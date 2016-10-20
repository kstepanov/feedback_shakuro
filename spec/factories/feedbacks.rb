FactoryGirl.define do
  factory :feedback do
    request nil
    customer_name 'customer name'
    customer_email 'john@example.com'
    project_name 'project name'
    feature_name 'feature name'
    details 'details'
  end
end
