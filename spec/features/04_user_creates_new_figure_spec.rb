# frozen_string_literal: true
require 'rails_helper'

feature 'As an authenticated user, I want to add a historical figure
  so that others can review it' do

  scenario 'user adds new historical figure successfully' do
    visit new_figure_path
    expect(page).to have_content 'Add a New Historical Figure'

    fill_in 'Name', with: 'George Washington'
    fill_in 'Occupation', with: 'First President of the United States'
    fill_in 'Era', with: 'American Revolution'
    fill_in 'Nationality', with: 'American'
    fill_in 'Claim to Fame', with: "Chopped down father's cherry tree"

    click_button 'Add Historical Figure'

    expect(page).to have_content 'Figure added successfully'
    expect(page).to have_content 'George Washington'
    expect(page).to have_content "Chopped down father's cherry tree"
  end

  scenario 'user does not provide proper information to add new figure' do
    visit new_figure_path

    click_button 'Add Historical Figure'
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Occupation can't be blank"
    expect(page).to have_content "Era can't be blank"
    expect(page).to have_content "Nationality can't be blank"
    expect(page).to have_content "Claim to fame can't be blank"
  end
end
