# require "rails_helper"
#
# feature "visitor sees appropriate prompts to sign in/appropriate features when signed in" do
#   let!(:myles) { User.create!(name: 'Myles') }
#   let!(:cameron) { User.create!(name: 'Cameron') }
#   let!(:lincoln) { Figure.create!(name: 'Abraham Lincoln', occupation: 'Politician', era: "1800's", nationality: 'American', claim_to_fame: 'Ended slavery', average_rating: 5) }
#   let!(:rating_one) { Rating.create!(rating: 5, review: "I love Lincoln, this dude was bomb. I am being him for Halloween.", user_id: myles.id, figure_id: lincoln.id) }
#
# xscenario "able to submit a review via show page" do
#   sign_in as myles
#   visit figure_path(lincoln)
#
#   choose "5"
#   fill_in "Review", with: "Lincoln for the win, kid."
#   click_button "Submit"
#
#   expect(page).to have_content ("New review added!")
#   expect(page).to have_content ("Lincoln for the win, kid.")
# end
#
# xscenario "user can't submit a review over 140 characters" do
#   sign_in as myles
#   visit figure_path(lincoln)
#
#   choose "5"
#   fill_in "Review", with: "This is a huge block of text that is over 140 characters in length and shouldn't be accepted by the system because it is too long and therefore an invalid entry. For more information on lengths of text fields, please visit www.whocares.org. Ok that is probably long enough."
#   click_button "Submit"
#
#   expect(page).to have_content ("Review not submitted: review should be less than 140 characters.")
# end
#
#
# xscenario "show page has sign-in prompt for users who aren't signed in" do
#   visit figure_path(lincoln)
#
#   expect(page).to have_content "Sign in to be able to submit ratings and reviews!"
# end
#
# scenario "show page has create new user prompt for new users" do
#   visit figure_path(lincoln)
#
#   expect(page).to have_content "New to Historank?  Click here to create a new username to gain access to all of our features!"
# end
#
# xscenario "show page allows users to upvote or downvote other users' reviews" do
#   sign_in as cameron
#   visit figure_path(lincoln)
#
#   click_button "Upvote"
#   expect(page).to have_content "Votes: 1"
#
#   click_button "Downvote"
#   expect(page).to have_content "Votes: -1"
# end
#
# xscenario "you try to upvote something more than once" do
#   sign_in as cameron
#   visit figure_path(lincoln)
#
#   click_button "Upvote"
#   expect(page).not_to have_content("Upvote")
#   expect(page).to have_content("Downvote")
#   click_button "Downvote"
#   expect(page).to have_content("Upvote")
#   expect(page).not_to have_content("Downvote")
# end
