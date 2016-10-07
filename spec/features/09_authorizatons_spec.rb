# frozen_string_literal: true
require 'spec_helper'
require 'rails_helper'

feature 'admin has full ability to see site' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:figure) { FactoryGirl.create(:figure) }
  let!(:rating) { FactoryGirl.create(:rating, figure_id: figure.id, user_id: user.id) }
  let!(:admin) do
    User.create!(
      first_name: 'Cameron',
      last_name: 'Cogan',
      role: 'admin',
      email: 'admin@launch.com',
      password: 'password'
    )
  end

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

    expect{visit users_path}.to raise_error('Not Found')
  end

  scenario 'admin deletes a user' do
    visit root_path
    sign_in admin
    visit users_path
    click_link user.id

    click_button 'Delete Account'

    expect(page).to have_content 'History no longer recognizes this user.'
  end

  scenario 'admin deletes a figure' do
    visit root_path
    sign_in admin
    visit figures_path
    click_link figure.name

    click_button 'Delete Figure'

    expect(page).to have_content 'History no longer recognizes this figure'
  end

  scenario 'admin deletes a review' do
    visit root_path
    sign_in admin
    visit figures_path
    click_link figure.name

    click_button 'Delete Review'

    expect(page).to have_content 'History no longer recognizes this review'
  end
end
