require 'spec_helper'
require "rails_helper"


feature "User can log in with existing account" do
  let!(:user) { User.create!(email: "cameron@example.com", first_name: 'Cameron', last_name: 'Cogan', password: 'password') }

  scenario 'with valid information' do
    visit root_path
    click_link 'Sign In'
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
  end

  scenario "with invalid information" do
    visit root_path
    click_link 'Sign In'
    fill_in "Email", with: user.email
    fill_in "Password", with: "Wrong"
    click_button "Log in"

    expect(page).to have_content("Invalid Email or password.")
  end

end
