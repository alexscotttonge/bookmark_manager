

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
