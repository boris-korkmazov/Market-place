require 'rails_helper'

feature 'Sign In', %q{
  In order to sign in
  As user
  I want to be able to sign in
} do

  given(:user) { create :user }

  scenario 'sign in' do

    visit '/'

    click_on 'Sign In'

    expect(page).to have_title('Sign In')

    fill_in 'Email', with: user.email

    fill_in 'Password', with: user.password

    click_on 'Send'

    expect(page).to have_content('Signed in successfully')

    expect(page).to_not have_link('Sign In')

    expect(current_path).to eq root_path
  end
end

