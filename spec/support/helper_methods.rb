module HelperMethods

  def sign_up_as(user)
    visit '/users/new'

    fill_in :name,                  with: user.name
    fill_in :username,              with: user.username
    fill_in :email,                 with: user.email
    fill_in :password,              with: user.password
    fill_in :password_confirmation, with: user.password_confirmation
    click_button 'Sign up'
  end

  def log_in_as(user)
    visit '/sessions/new'

    fill_in :email,    with: user.email
    fill_in :password, with: user.password
    click_button 'Log in'
  end

  def add_peep_with(text)
    visit '/peeps/new'

    fill_in :message, with: text.message
    click_button 'Peep'
  end

end
