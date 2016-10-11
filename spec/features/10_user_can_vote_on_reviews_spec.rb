require 'spec_helper'
require 'rails_helper'

# [] User should be able to see score of a review (upvotes - downvotes)
# [] User can upvote or downvote a review
# [] User cannot upvote or downvote rating
# [] User can only upvote or downvote a review once
# [] User can change from upvote to downvote and vice versa

feature 'user can upvote or downvote a review' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:figure) { FactoryGirl.create(:figure) }
  let!(:rating) { FactoryGirl.create(:rating, user_id: user.id, figure_id: figure.id) }

  scenario 'user upvotes a review', js: true do
    sign_in(user)
    visit figure_path(figure)

    click_on 'Upvote'
    expect(page).to have_content '1'
  end

  scenario 'user downvotes a review', js: true do
    sign_in(user)
    visit figure_path(figure)

    click_on 'Downvote'

    expect(page).to have_content '-1'
  end

  scenario 'user upvotes a review and tries to upvote again', js: true do
    sign_in(user)
    visit figure_path(figure)

    click_on 'Upvote'
    click_on 'Upvote'

    expect(page).to have_content '0'
  end

  scenario 'user upvotes a review and then changes to downvote', js: true do
    sign_in(user)
    visit figure_path(figure)

    click_on 'Upvote'

    expect(page).to have_content '1'

    click_on 'Downvote'

    expect(page).to have_content '-1'
  end
end
