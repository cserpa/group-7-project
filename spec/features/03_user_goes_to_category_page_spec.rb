require "rails_helper"

feature "visitor goes to category show page" do
  let!(:myles) { User.create!(first_name: 'Myles', last_name: 'Olson', email: 'myles@example.com', password: 'password') }
  let!(:cameron) { User.create!(first_name: 'Cameron', last_name: 'Cogan', email: 'cameron@example.com', password: 'password') }
  let!(:hitler) { Figure.create!(name: 'Adolf Hitler', occupation: 'Dictator', era: "1900's", nationality: 'Austrian', claim_to_fame: 'Killed six million people', average_rating: 0)}
  let!(:lincoln) { Figure.create!(name: 'Abraham Lincoln', occupation: 'Politician', era: "1800's", nationality: 'American', claim_to_fame: 'Ended slavery', average_rating: 5) }
  let!(:rating_one) { Rating.create!(rating: 5, review: "I love Lincoln, this dude was bomb. I am being him for Halloween.", user_id: myles.id, figure_id: lincoln.id) }
  let!(:rating_two) { Rating.create!(rating: 0, review: "Hitler sucks", user_id: myles.id, figure_id: hitler.id) }
  let!(:politician) { Category.create!(name: 'Politicians') }
  let!(:lincoln_politician) { Categorization.create!( figure_id: lincoln.id, category_id: politician.id )}
  let!(:hitler_politician) { Categorization.create!( figure_id: hitler.id, category_id: politician.id )}

  scenario "visitor goes to category page" do
    visit category_path(politician)

    expect(page).to have_content "Abraham Lincoln"
  end

  scenario "they should be sorted according to rating" do
    visit category_path(politician)

    expect(page.body.index(hitler.name) < page.body.index(lincoln.name))
  end

end
