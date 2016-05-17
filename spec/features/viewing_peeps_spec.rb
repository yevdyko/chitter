# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order
feature 'User sees all peeps' do
  let(:user) { create :user }
  let(:text) { create :text }

  # As a user
  # So that I can be sure that peeps are placed in reverse order
  # I want to see my last peep at the top
  scenario 'when visiting the homepage' do
    other_text = build(:text, message: 'My second peep')
    log_in_as user
    add_peep_with text
    add_peep_with other_text
    within('li#peeps__item', match: :first) do
      expect(page).to have_content 'My second peep'
    end
  end
end
