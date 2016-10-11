FactoryGirl.define do
 factory :user do
   first_name 'Chris'
   last_name 'Serpa'
   sequence(:email) { |n| 'cserpa123' + n.to_s + '@gmail.com' }
   password 'devise'
 end
