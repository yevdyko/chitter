# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
feature 'User adds a new peep' do
  let(:user) { create :user }
  let(:text) { create :text }

  scenario 'after logging in' do
    log_in_as user
    add_peep_with text
    expect(current_path).to eq '/peeps'
    within 'li.peeps__item' do
      expect(page).to have_content "#{text.message}"
    end
  end
end
