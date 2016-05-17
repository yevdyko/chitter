# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
feature 'User signs up' do
  scenario 'when being a new user visiting the site' do
    user = build :user
    expect { sign_up_as user }.to change(User, :count).by(1)
    expect(page).to have_content "Welcome, #{user.full_name}!"
    expect(User.first.email).to eq "#{user.email}"
  end

  scenario 'with a password that does not match' do
    user = build(:user, password_confirmation: 'wrong')
    expect { sign_up_as user }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'without filling in a full name' do
    user = build(:user, full_name: nil)
    expect { sign_up_as user }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Full name must not be blank'
  end

  scenario 'without filling in an email' do
    user = build(:user, email: nil)
    expect { sign_up_as user }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Email must not be blank'
  end

  scenario "with an invalid email address" do
    user = build(:user, email: 'johndoe@email')
    expect { sign_up_as user }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Email has an invalid format'
  end

  scenario 'with an email that is already registered' do
    user = build :user
    sign_up_as user
    expect { sign_up_as user }.to_not change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end
end

# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter
feature 'User logs in' do
  scenario 'with correct credentials' do
    user = create :user
    log_in_as user
    expect(page).to have_content "Welcome, #{user.full_name}!"
  end

  scenario 'with incorrect credentials' do
    user = build(:user, password: 's3cret')
    log_in_as user
    expect(page).to have_content 'The email or password is incorrect'
  end
end

# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter
feature 'User logs out' do
  scenario 'while being logged in' do
    user = create :user
    log_in_as user
    click_button 'Log out'
    expect(page).to have_content "Goodbye, #{user.full_name}!"
    expect(page).not_to have_content "Welcome, #{user.full_name}!"
  end
end
