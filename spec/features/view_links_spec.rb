feature 'list of links on homepage' do
  scenario 'links are displayed on the homepage' do
    # We can use `.create`, which we used in irb to make a Student, within our test!
    Link.create(url: 'http://www.yogibrain.org', title: 'Yogi Brain')

    visit '/links'

    # this is a *temporary* sanity check - to make sure we
   # can load the page :)
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Yogi Brain')
    end
  end
end
