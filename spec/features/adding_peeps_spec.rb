# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
feature 'User adds a new peep' do
  scenario 'after logging in' do
    user = create :user
    text = create :text
    log_in_as user
    add_peep_with text
    expect(current_path).to eq '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content "#{text.message}"
    end
  end
end
