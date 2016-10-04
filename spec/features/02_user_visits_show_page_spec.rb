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
  let(:cameron) { User.create!(username: 'Cameron') }
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
    sign_in as myles
    visit figure_path(lincoln)

    choose "5"
    fill_in "Review", with: "Lincoln for the win, kid."
    click_button "Submit"

    expect(page).to have_content ("New review added!")
    expect(page).to have_content ("Lincoln for the win, kid.")
  end

  scenario "user can't submit a review over 140 characters"
    sign_in as myles
    visit figure_path(lincoln)

    choose "5"
    fill_in "Review", with: "This is a huge block of text that is over 140 characters in length and shouldn't be accepted by the system because it is too long and therefore an invalid entry. For more information on lengths of text fields, please visit www.whocares.org. Ok that is probably long enough."
    click_button "Submit"

    expect(page).to have_content ("Review not submitted: review should be less than 140 characters.")
  end


  scenario "show page has sign-in prompt for users who aren't signed in" do
    visit figure_path(lincoln)

    expect(page).to have_content "Sign in to be able to submit ratings and reviews!"
  end

  scenario "show page has create new user prompt for new users" do
    visit figure_path(lincoln)

    expect(page).to have_content "New to Historank?  Click here to create a new username to gain access to all of our features!"
  end

  scenario "show page allows users to upvote or downvote other users' reviews" do
    sign_in as cameron
    visit figure_path(lincoln)

    click_button "Upvote"
    expect(page).to have_content "Votes: 1"

    click_button "Downvote"
    expect(page).to have_content "Votes: -1"
  end

  scenario "you try to upvote something more than once" do
    sign_in as cameron
    visit figure_path(lincoln)

    click_button "Upvote"
    expect(page).not_to have_content("Upvote")
    expect(page).to have_content("Downvote")
    click_button "Downvote"
    expect(page).to have_content("Upvote")
    expect(page).not_to have_content("Downvote")
  end

end
