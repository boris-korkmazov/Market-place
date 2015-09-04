require 'rails_helper'

feature 'guest sign up', %q{
  In order to create maker account
  As guest user
  I want to be able to create account
} do

      scenario 'sign up' do

        visit '/'

        click_on 'Sign Up'

        fill_in 'Email', with: 'test@mail.com'

        fill_in 'Password', with: '12345678'

        fill_in 'Confirm your password', with: '12345678'

        click_on 'Send'

        expect(page).to have_content 'Welcome! You have signed up successfully.'

        expect(page).to_not have_content('Sign Up')

      end

end