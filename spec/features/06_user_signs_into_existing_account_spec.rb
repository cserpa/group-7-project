require 'spec_helper'
require "rails_helper"

feature 'user can log in/out of existing account' do
  let!(:user) do
    User.create!(
      email: 'cameron@example.com',
      first_name: 'Cameron',
      last_name: 'Cogan',
      password: 'password'
    )
  end

  scenario 'successful sign-in of inauthenticated with valid information' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_content('Signed in successfully.')
  end

  scenario 'unsuccessful sign-in of inautheticated user with wrong password' do
    visit root_path
    click_link 'Sign In'
    fill_in "Email", with: user.email
    fill_in 'Password', with: 'Wrong'
    click_button 'Log in'

    expect(page).to have_content('Invalid Email or password.')
  end

  scenario 'successful sign-out of authenticated user' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    click_link 'Sign Out'

    expect(page).to have_content('Signed out successfully.')
  end
end
