FactoryGirl.define do
  factory :rating do
    rating 5
    review 'This review sure is good'
    user_id 1
    figure_id 2
  end
end
