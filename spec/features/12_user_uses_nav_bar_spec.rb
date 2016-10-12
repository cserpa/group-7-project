require 'spec_helper'
require 'rails_helper'

feature 'navbar has links to site features' do
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'authenticated user sees navbar on homepage' do
    sign_in user
    visit root_path

    expect(page).to have_link 'Sign Out'
    expect(page).to have_link 'Add a Figure'
    expect(page).to have_link 'Figures'
    expect(page).to have_link 'Profile'
  end

  scenario 'authenticated user sees navbar on profile page' do
    sign_in user
    visit root_path
    click_link 'Profile'

    expect(page).to have_link 'Sign Out'
    expect(page).to have_link 'Add a Figure'
    expect(page).to have_link 'Figures'
    expect(page).to have_link 'Profile'
  end

  scenario 'authenticated user sees navbar on new figure page' do
    sign_in user
    visit root_path
    click_link 'Add a Figure'

    expect(page).to have_link 'Sign Out'
    expect(page).to have_link 'Add a Figure'
    expect(page).to have_link 'Figures'
    expect(page).to have_link 'Profile'
  end

  scenario 'unauthenticated user clicks on nav bar links from homepage' do
    visit root_path
    expect(page).to have_link 'Sign Up'
    expect(page).to have_link 'Sign In'
    expect(page).to have_link 'Figures'
  end

  scenario 'unauthenticated user clicks on nav bar links from sign up page' do
    visit root_path
    click_link 'Sign Up'
    expect(page).to have_link 'Sign Up'
    expect(page).to have_link 'Sign In'
    expect(page).to have_link 'Figures'
  end

  scenario 'unauthenticated user clicks on nav bar links from sign in page' do
    visit root_path
    click_link 'Sign In'
    expect(page).to have_link 'Sign Up'
    expect(page).to have_link 'Sign In'
    expect(page).to have_link 'Figures'
  end
end
