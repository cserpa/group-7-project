require 'spec_helper'
require "rails_helper"


feature 'An inauthenticated user can create a new account' do
  scenario 'sees sign up link at the root page' do
    visit root_path
    click_link 'Sign Up'

    expect(page).to have_content('Sign Up')
  end

  scenario 'successfully creates a new account' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'First Name', with: 'John'
    fill_in 'Last Name', with: 'Doe'
    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Password', with: 'unsecure'
    fill_in 'Password Confirmation', with: 'unsecure'
    click_button 'Sign Up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'sees errors when supplying invalid information' do
    visit root_path
    click_link 'Sign Up'
    click_button 'Sign Up'

    expect(page).to have_content('can\'t be blank')
  end

  scenario 'sees error when supplying mismatched passwords' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'First Name', with: 'John'
    fill_in 'Last Name', with: 'Doe'
    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Password', with: 'matching'
    fill_in 'Password Confirmation', with: 'notmatching'
    click_button 'Sign Up'

    expect(page).to have_content('confirmation doesn\'t match Password')
  end
end
