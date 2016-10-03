require "rails_helper"

# [] As a bored user, I want to get my kicks reviewing a hisotrical figure's page and seeing the reviews of them.
# [] Going to a figure's show page should give a brief profile and then a list of short reviews.
# [] The rating entry form should be on the show pages.
# [] Rating form allows user to rate figure on scale of zero to five stars with optional reviews.
# [] Users only see rating form if they are signed in.
# [] Reviews should have a maximum length to keep them short and snappy.
# [] You should be able to upvote or downvote a review from the show page.
# [] You should only be able to upvote or downvote a review once, in other words you can't upvote it repeatedly.
# [] Users should only see a raw score of each review upvote/downvote total.
# [] Users should see the aggregate rating of the historical figure.


feature "visitors see profile and reviews on show page" do
  let(:myles) { User.create!(username: 'Myles') }
  let(:lincoln) { Figure.create!(name: 'Abraham Lincoln', occupation: 'politician', era: '1800s', nationality: 'American', claim_to_fame: 'Ended slavery') }
  let(:rating_one) { Rating.create!(rating: 5, review: "I love Lincoln, this dude was bomb. I am being him for Halloween.", user_id: myles.id, figure_id: lincoln.id) }

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

  scenario "able to submit a review via show page"
    visit figure_path(lincoln)
    sign_in as myles

    choose "5"
    fill_in "Review", with: "Lincoln for the win, kid."
    click_button "Submit"

    expect(page).to have_content ("New review added!")
    expect(page).to have_content ("Lincoln for the win, kid.")

    
end
