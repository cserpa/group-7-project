require 'spec_helper'
require 'rails_helper'

feature 'user can search for figures in the search bar' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:figure) { FactoryGirl.create(:figure) }
  let!(:figure_2) { FactoryGirl.create(:figure, name: 'George Washington') }

  scenario 'user successfully searches for figure' do
    visit root_path

    fill_in "search", with: 'Lincoln'
    click_button "Search"

    expect(page).to have_content 'Abraham Lincoln'
    expect(page).to_not have_content 'George Washington'
  end

  scenario 'user searches for figure that does not exist' do
    visit root_path

    fill_in "search", with: 'Ghandi'
    click_button "Search"

    expect(page).to have_content 'There are no figures that match Ghandi'
  end
end
