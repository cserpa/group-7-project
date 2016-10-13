require 'spec_helper'
require 'rails_helper'

feature 'user can upvote or downvote a review' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:figure) { FactoryGirl.create(:figure, user: user) }
  let!(:rating) { FactoryGirl.create(:rating, user: user, figure: figure) }

  scenario 'user upvotes a review', js: true do
    sign_in(user)
    visit figure_path(figure)
    click_on 'Upvote'
    expect(page).to have_content '1'
    visit root_path
  end

  scenario 'user downvotes a review', js: true do
    sign_in(user)
    visit figure_path(figure)

    click_on 'Downvote'

    expect(page).to have_content '-1'
    visit root_path
  end

  scenario 'user upvotes a review and tries to upvote again', js: true do
    sign_in(user)
    visit figure_path(figure)

    click_on 'Upvote'
    click_on 'Upvote'

    expect(page).to have_content '0'
    visit root_path
  end

  scenario 'user downvotes a review and tries to upvote it again', js: true do
    sign_in(user)
    visit figure_path(figure)

    click_on 'Downvote'
    click_on 'Upvote'

    expect(page).to have_content '1'
    visit root_path
  end

  scenario 'user downvotes a review and tries to downvote it again', js: true do
    sign_in(user)
    visit figure_path(figure)

    click_on 'Downvote'
    click_on 'Downvote'

    expect(page).to have_content '0'
    visit root_path
  end
end
