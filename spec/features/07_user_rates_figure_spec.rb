# frozen_string_literal: true
require 'spec_helper'
require 'rails_helper'

# [] user can adda rating
# [] rating should be added to average rating
# [] user should be able to optionally add review to rating

feature 'user adds rating for historical figure' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:figure) { FactoryGirl.create(:figure) }
  def sign_in(user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  scenario 'user adds rating successfully without review' do
    sign_in(user)
    visit figure_path(figure)

    choose '5'
    click_button 'Submit Rating'

    expect(page).to have_content 'Rating submitted successfully!'
    expect(page).to have_content 'Average Rating: 5'
  end

  scenario 'user adds rating successful with review' do
    sign_in(user)
    visit figure_path(figure)

    choose '5'
    fill_in 'Review', with: 'This guy was so nice, but so ugly.'
    click_button 'Submit Rating'

    expect(page).to have_content 'Rating submitted successfully!'
    expect(page).to have_content 'Average Rating: 5'
    expect(page).to have_content 'This guy was so nice, but so ugly.'
  end

  scenario 'user adds rating with review not formatted correctly' do
    sign_in(user)
    visit figure_path(figure)

    choose '5'
    fill_in 'Review', with:
     'Sed ut perspiciatis unde omnis iste natus error sit voluptatem
      accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab
      illo inventore veritatis et quasi architecto beatae vitae dicta sunt
      explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut
      odit aut fugit, sed quia consequuntur magni dolores eos qui ratione
      voluptatem sequi nesciunt.'
      
    click_button 'Submit Rating'

    expect(page).to have_content 'Review is too long (maximum 140 characters)'
  end

  scenario 'user is not signed in and cannot rate figure' do
    visit figure_path(figure)

    expect(page).to_not have_content 'Submit Rating'
  end
end
