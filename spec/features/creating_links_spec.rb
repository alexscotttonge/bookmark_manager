

feature 'allows users to create links' do
  scenario 'user can add links title and url' do
    visit '/links/new'
    fill_in "title", with: 'Makers Academy'
    fill_in "url", with: 'makersacademy.com'
    click_button "Create link"

    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end
end

feature 'user can add tag' do
  scenario 'user can add a tag to links field' do
    visit '/links/new'
    fill_in "title", with: 'Makers Academy'
    fill_in "url", with: 'makersacademy.com'
    fill_in "tags", with: 'Ideas'

    click_button "Create link"
    link = Link.first
    expect(link.tags.map(&:name)).to include('Ideas')
  end
end
