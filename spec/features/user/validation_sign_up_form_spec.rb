require 'rails_helper'


feature 'Validation the sign up form', %q{
  In order to validate user typing
  As guest user
  I want to validate sign up form
} do

  given!(:user) {create(:user)}

  context 'validate on the server' do

    scenario 'sign up with empty email' do
      visit '/'

      click_on 'Sign Up'

      fill_in 'Email', with: ''

      fill_in 'Password', with: '12345678'

      fill_in 'Confirm your password', with: '12345678'

      click_on 'Send'

      expect(page).to have_content "Email can't be blank"
    end

    scenario 'sign up with exists email' do
      visit '/'

      click_on 'Sign Up'

      fill_in 'Email', with: user.email

      fill_in 'Password', with: '12345678'

      fill_in 'Confirm your password', with: '12345678'

      click_on 'Send'

      expect(page).to have_content "Email has already been taken"
    end

    scenario 'sign up with invalid email' do
      visit '/'

      click_on 'Sign Up'

      fill_in 'Email', with: 'qewerr'

      fill_in 'Password', with: '12345678'

      fill_in 'Confirm your password', with: '12345678'

      click_on 'Send'

      expect(page).to have_content "Email is invalid"
    end

    scenario 'sign up with empty password' do
      visit '/'

      click_on 'Sign Up'

      fill_in 'Email', with: 'test@mail.com'

      fill_in 'Password', with: ''

      fill_in 'Confirm your password', with: ''

      click_on 'Send'

      expect(page).to have_content "Password can't be blank"
    end

    scenario 'sign up with invalid password' do
      visit '/'

      click_on 'Sign Up'

      fill_in 'Email', with: 'test@mail.com'

      fill_in 'Password', with: '123'

      fill_in 'Confirm your password', with: '123'

      click_on 'Send'

      expect(page).to have_content "Password length should be more than 8 characters"
    end

    scenario 'sign up with empty password confirmation' do
      visit '/'

      click_on 'Sign Up'

      fill_in 'Email', with: 'test@mail.com'

      fill_in 'Password', with: '123'

      fill_in 'Confirm your password', with: ''

      click_on 'Send'

      expect(page).to have_content "Password confirmation should match Password"
    end

    scenario 'sign up with invalid password confirmation' do
      visit '/'

      click_on 'Sign Up'

      fill_in 'Email', with: 'test@mail.com'

      fill_in 'Password', with: '123'

      fill_in 'Confirm your password', with: ''

      click_on 'Send'

      expect(page).to have_content "Password confirmation should match Password"
    end
  end

  context "js validation" do

    scenario 'sign up with empty email', js:true do
      visit '/'

      click_on 'Sign Up'

      fill_in 'Email', with: ''

      fill_in 'Password', with: '12345678'

      fill_in 'Confirm your password', with: '12345678'

      find('input[type=submit]').click()

      expect(current_path).to eq new_user_registration_path

      expect(page).to have_content "Email can't be blank"
    end

    scenario 'sign up with exists email', js: true do

      visit '/'

      click_on 'Sign Up'

      fill_in 'Email', with: user.email

      fill_in 'Password', with: '12345678'

      fill_in 'Confirm your password', with: '12345678'

      find('input[type=submit]').click()

      expect(current_path).to eq new_user_registration_path

      expect(page).to have_content "Email has already been taken"
    end

    scenario 'sign up with invalid email', js: true do
      visit '/'

      click_on 'Sign Up'

      fill_in 'Email', with: 'qewerr'

      fill_in 'Password', with: '12345678'

      fill_in 'Confirm your password', with: '12345678'

      find('input[type=submit]').click()

      expect(current_path).to eq new_user_registration_path

      expect(page).to have_content "Email is invalid"
    end

    scenario 'sign up with empty password', js:true do
      visit '/'

      click_on 'Sign Up'

      fill_in 'Email', with: 'test@mail.com'

      fill_in 'Password', with: ''

      fill_in 'Confirm your password', with: ''

      find('input[type=submit]').click()

      expect(current_path).to eq new_user_registration_path

      expect(page).to have_content "Password can't be blank"
    end

    scenario 'sign up with invalid password', js:true do
      visit '/'

      click_on 'Sign Up'

      fill_in 'Email', with: 'test@mail.com'

      fill_in 'Password', with: '123'

      fill_in 'Confirm your password', with: '123'

      find('input[type=submit]').click()

      expect(current_path).to eq new_user_registration_path

      expect(page).to have_content "Password length should be more than 8 characters"
    end

    scenario 'sign up with empty password confirmation', js: true do
      visit '/'

      click_on 'Sign Up'

      fill_in 'Email', with: 'test@mail.com'

      fill_in 'Password', with: '123'

      fill_in 'Confirm your password', with: ''

      find('input[type=submit]').click()

      expect(current_path).to eq new_user_registration_path

      expect(page).to have_content "Password confirmation should match Password"
    end

    scenario 'sign up with invalid password confirmation', js:true do
      visit '/'

      click_on 'Sign Up'

      fill_in 'Email', with: 'test@mail.com'

      fill_in 'Password', with: '123'

      fill_in 'Confirm your password', with: '345'

      expect(page).to have_content "Password confirmation should match Password"

      find('input[type=submit]').click()

      expect(current_path).to eq new_user_registration_path
    end

  end
end