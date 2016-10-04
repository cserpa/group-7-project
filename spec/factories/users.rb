FactoryGirl.define do
 factory :user do
   first_name "Chris"
   last_name "Serpa"
   email "cserpa123@gmail.com"
   encrypted_password "devise"
 end
end
