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
      claim_to_fame: 'Killed six million people',
      user: cameron
    )
  end

  let!(:lincoln) do
    Figure.create!(
      name: 'Abraham Lincoln',
      occupation: 'Politician',
      era: "1800's",
      nationality: 'American',
      claim_to_fame: 'Ended slavery',
      user: cameron
    )
  end

  let!(:rating_one) do
    Rating.create!(
      rating: 5,
      review: 'I love Lincoln!',
      user: myles,
      figure: lincoln
    )
  end

  let!(:rating_two) do
    Rating.create!(
      rating: 0,
      review: 'Hitler sucks',
      user: myles,
      figure: hitler
    )
  end

  let!(:politician) do
    Category.create!(
      name: 'Politicians'
    )
  end

  let!(:lincoln_politician) do
    Categorization.create!(
      figure: lincoln,
      category: politician
    )
  end

  let!(:hitler_politician) do
    Categorization.create!(
      figure: hitler,
      category: politician
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
