require 'rails_helper'

feature 'guest sign up', %q{
  In order to create maker account
  As guest user
  I want to be able to create account
} do

  context 'Authenticated user' do
    scenario 'should be redirected to index page'
  end

end