# frozen_string_literal: true
require 'rails_helper'

feature 'visitors see the index page' do
  let!(:lincoln) do
    Figure.create!(
      name: 'Abraham Lincoln',
      occupation: 'politician',
      era: '1800s',
      nationality: 'American',
      claim_to_fame: 'Ended slavery',
      average_rating: 5
      )
  end

  scenario 'visitor visits the index page' do
    visit figures_path
    expect(page).to have_content 'Historical Figure Index'
    expect(page).to have_content 'Abraham Lincoln - politician'
  end

  scenario 'clicking figure will take the user to the Figure\'s show page' do
    visit figures_path
    click_link 'Abraham Lincoln'
    expect(current_path).to eq figure_path(lincoln)
  end

  scenario 'Figures should be arranged by category' do
    visit figures_path
    expect(page).to have_content 'Highest Rated'
    expect(page).to have_content 'Lowest Rated'
    expect(page).to have_content 'Recently Added'
  end
end
