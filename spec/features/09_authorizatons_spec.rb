# frozen_string_literal: true
require 'spec_helper'
require 'rails_helper'

feature 'admin has full ability to see site' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:admin) { FactoryGirl.create(:user, role: 'admin', email: 'admin@launch.com') }

  scenario 'admin can see list of users' do
    visit root_path
    sign_in admin
    visit users_path

    expect(page).to have_content user.name
    expect(page).to have_content admin.name
  end

  scenario 'user cannot see list of users' do
    visit root_path
    sign_in user

    expect{visit users_path}.to raise_error("Not Found")
  end

  scenario 'admin deletes a user' do
    visit root_path
    sign_in admin
    visit users_path

    click_link user.id
    click_button "Delete Account"

    click_button "Yes"

    expect(page).to have_content "History no longer recognizes this user."
  end
end
