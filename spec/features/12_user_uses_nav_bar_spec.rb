require 'spec_helper'
require 'rails_helper'

feature 'navbar has links to site features' do
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'authenticated user clicks on nav bar links from any page' do
    sign_in user
    visit root_path
    expect(page).to have_link "Sign Out"
    expect(page).to have_link "Add a Figure"
    expect(page).to have_link "Figures"
    expect(page).to have_link "Profile"

    click_link "Profile"
    visit root_path
    expect(page).to have_link "Sign Out"
    expect(page).to have_link "Add a Figure"
    expect(page).to have_link "Figures"
    expect(page).to have_link "Profile"

    click_link "Add a Figure"
    visit root_path
    expect(page).to have_link "Sign Out"
    expect(page).to have_link "Add a Figure"
    expect(page).to have_link "Figures"
    expect(page).to have_link "Profile"
  end

  scenario 'unauthenticated user clicks on nav bar links from any page' do
    visit root_path
    expect(page).to have_link "Sign Up"
    expect(page).to have_link "Sign In"
    expect(page).to have_link "Figures"


    click_link "Sign Up"
    expect(page).to have_link "Sign Up"
    expect(page).to have_link "Sign In"
    expect(page).to have_link "Figures"

    click_link "Sign In"
    expect(page).to have_link "Sign Up"
    expect(page).to have_link "Sign In"
    expect(page).to have_link "Figures"
  end
end
