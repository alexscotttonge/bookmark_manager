feature 'forms have title attributes' do
  scenario 'title and url placeholders' do
    visit '/links/new'
    within 'form#form' do
      expect(page).to have_content 'Enter Title:'
      expect(page).to have_content 'Enter URL:'
    end
  end
end
