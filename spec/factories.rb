FactoryGirl.define do
  factory :user, class: User do
    full_name             'John Doe'
    email                 'johndoe@email.com'
    password              'password'
    password_confirmation 'password'
  end

  factory :text, class: Peep do
    message 'This is my peep!'
  end
end
