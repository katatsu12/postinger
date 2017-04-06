FactoryGirl.define do
  factory :account do
    provider 'MyString'
    uid 'MyString'
    token_twitter 'MyString'
    secret_twitter 'MyString'
    user nil
  end
end
