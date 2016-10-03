require "rails_helper"

# [] As a user, I want to see a list of historical figures.
# [] Clicking on a figure should bring us to its show page.
# [] Figures should be arranged in terms of some metric, such as how many upvotes they have or when their last review was.

feature "visitors see the index page" do
  let(:lincoln) { Figure.create!(name: 'Abraham Lincoln', occupation: 'politician', era: '1800s', nationality: 'American', claim_to_fame: 'Ended slavery') }
  scenario "visitor visits the index page" do

    visit figures_path
    expect(page).to have_content "Hisotrical Figure Index"
    expect(page).to have_content "Abraham Lincoln - politician"


    end

  scenario "clicking on a figure will take the user to the Figure's show page" do
    visit figures_path

    click_link "Abraham Lincoln"
    expect(current_path).to eq figure_path(lincoln)

  end

  scenario "Figures should be arranged by category" do
    visit figures_path

    expect(page).to have_content "Higest Rated"
    expect(page).to have_content "Lowest Rated"
    expect(page).to have_content "Recently Added"

  end
end
