# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order
feature 'User sees all peeps' do
  let(:user) { create :user }
  let(:text) { create :text }

  # As a user
  # So that I can be sure that peeps are placed in reverse order
  # I want to see my last peep at the top
  scenario 'in reverse chronological order' do
    other_text = build(:text, message: 'My second peep')
    log_in_as user
    add_peep_with text
    add_peep_with other_text
    within('li.peeps__item', match: :first) do
      expect(page).to have_content 'My second peep'
    end
  end

  scenario 'with the name of the author' do
    log_in_as user
    add_peep_with text
    within('li.peeps__item') do
      expect(page).to have_content "#{user.name}"
    end
  end

  scenario 'with the username of the author' do
    log_in_as user
    add_peep_with text
    within('li.peeps__item') do
      expect(page).to have_content "@#{user.username}"
    end
  end

  # As a maker
  # So that I can better appreciate the context of a peep
  # I want to see how long ago message was peeped
  scenario 'with a created date' do
    time = DateTime.now + 2
    log_in_as user
    add_peep_with text
    Timecop.freeze(time)
    visit '/peeps'
    within('li.peeps__item') do
      expect(page).to have_content '2 days ago'
    end
  end
end
