require "rails_helper"

feature "visitors see profile and reviews on show page" do
  let!(:myles) { User.create!(name: 'Myles') }
  let!(:cameron) { User.create!(name: 'Cameron') }
  let!(:lincoln) { Figure.create!(name: 'Abraham Lincoln', occupation: 'Politician', era: "1800's", nationality: 'American', claim_to_fame: 'Ended slavery', average_rating: 5) }
  let!(:rating_one) { Rating.create!(rating: 5, review: "I love Lincoln, this dude was bomb. I am being him for Halloween.", user_id: myles.id, figure_id: lincoln.id) }

  scenario "show page has profile info" do
    visit figure_path(lincoln)

    expect(page).to have_content "Name: Abraham Lincoln"
    expect(page).to have_content "Occupation: Politician"
    expect(page).to have_content "Era: 1800's"
    expect(page).to have_content "Nationality: American"
    expect(page).to have_content "Claim to fame: Ended slavery"

  end

  scenario "show page has review info" do
    visit figure_path(lincoln)

    expect(page).to have_content "Aggregate Score: 5"
    expect(page).to have_content (rating_one.review)
  end

end
