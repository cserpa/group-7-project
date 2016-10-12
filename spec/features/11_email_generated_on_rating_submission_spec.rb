require 'spec_helper'
require 'rails_helper'

feature 'user can upvote or downvote a review' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:figure) { FactoryGirl.create(:figure, user: user) }

  scenario 'user upvotes a review' do
    sign_in(user)
    visit figure_path(figure)
    current_email_value = ActionMailer::Base.deliveries.count

    choose '5'
    click_button 'Submit Rating'
    expect(ActionMailer::Base.deliveries.count).to eq(current_email_value + 1)
  end
end
