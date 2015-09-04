require 'rails_helper'

feature 'Maker sign out', %q{
  In order to signed out
  As maker
  I want to be able to signed out
} do

  given(:user) { create :user }

  scenario 'sign out' do

    sign_in_as user

    click_on 'Sign Out'

    expect(page).to have_link('Sign In')
  end
end