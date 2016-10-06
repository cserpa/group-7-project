require 'rails_helper'

feature 'visitor goes to category show page' do
  let!(:myles) do
    User.create!(
      first_name: 'Myles',
      last_name: 'Olson',
      email: 'myles@example.com',
      password: 'password'
    )
  end

  let!(:cameron) do
    User.create!(
      first_name: 'Cameron',
      last_name: 'Cogan',
      email: 'cameron@example.com',
      password: 'password'
    )
  end

  let!(:hitler) do
    Figure.create!(
      name: 'Adolf Hitler',
      occupation: 'Dictator',
      era: "1900's",
      nationality: 'Austrian',
      claim_to_fame: 'Killed six million people'
    )
  end

  let!(:lincoln) do
    Figure.create!(
      name: 'Abraham Lincoln',
      occupation: 'Politician',
      era: "1800's",
      nationality: 'American',
      claim_to_fame: 'Ended slavery',
    )
  end

  let!(:rating_one) do
    Rating.create!(
      rating: 5,
      review: 'I love Lincoln!',
      user_id: myles.id,
      figure_id: lincoln.id
    )
  end

  let!(:rating_two) do
    Rating.create!(
      rating: 0,
      review: 'Hitler sucks',
      user_id: myles.id,
      figure_id: hitler.id
    )
  end

  let!(:politician) do
    Category.create!(
      name: 'Politicians'
    )
  end

  let!(:lincoln_politician) do
    Categorization.create!(
      figure_id: lincoln.id,
      category_id: politician.id
    )
  end

  let!(:hitler_politician) do
    Categorization.create!(
      figure_id: hitler.id,
      category_id: politician.id
    )
  end

  scenario 'visitor goes to category page' do
    visit category_path(politician)

    expect(page).to have_content 'Abraham Lincoln'
  end

  scenario 'they should be sorted according to rating' do
    visit category_path(politician)

    expect(page.body.index(hitler.name) < page.body.index(lincoln.name))
  end
end
