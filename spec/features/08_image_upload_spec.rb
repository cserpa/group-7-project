# frozen_string_literal: true
require 'spec_helper'
require 'rails_helper'

# [] user can adda rating
# [] rating should be added to average rating
# [] user should be able to optionally add review to rating

feature 'authenticated user adds image to profile' do
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'user adds image successfully' do
    visit root_path
    sign_in user
    click_link 'Profile'
    click_link 'Edit Profile Picture'
    attach_file('user_avatar', Rails.root +
                'spec/fixtures/launchhalloween16_720.jpg')
    click_button 'Update User'

    expect(page).to have_xpath(
      "//img[contains(@src,'launchhalloween16_720.jpg')]"
    )
  end
end
