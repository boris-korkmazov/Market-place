require 'rails_helper'

feature 'Sign In', %q{
  In order to sign in
  As maker
  I want to not be able to sign in
} do
  scenario 'should be redirected to index page'
end

