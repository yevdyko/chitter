feature 'Peeping' do
  let(:user) do
  User.create(full_name: "Incredible Yev",
              email: "incredible@yev.com",
              password: "bla-bla-bla",
              password_confirmation: "bla-bla-bla")
  end

  scenario "I can send a peep" do
    log_in(email: user.email,
           password: user.password)
    visit '/peeps/new'
    expect(page).to have_content "Write a Peep"
    fill_in :message, with: "This my first peep!"
    click_button 'Peep'
    expect(current_path).to eq '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content "This my first peep!"
    end
  end
end