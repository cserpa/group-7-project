require 'spec_helper'
require "rails_helper"


feature "User can create a new account" do

  scenario 'with valid information' do
    visit '/'
    click_link 'Sign Up'
    expect(page).to have_content("Sign Up")
    fill_in "First Name", with: "John"
    fill_in "Last Name", with: "Doe"
    fill_in "Email", with: "test@gmail.com"
    fill_in "Password", with: "unsecure"
    fill_in "Password Confirmation", with: "unsecure"
    click_button "Sign Up"

    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(page).to have_content("Sign Out")

  end

  scenario "without valid informatino" do
    visit root_path
    click_link 'Sign Up'
    click_button 'Sign Up'

    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content("Sign Out")

  end

  scenario "without matching passwords" do

  end

end
