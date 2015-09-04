require 'rails_helper'

feature 'Publish lesson by user', %q{
  In order to not publish lesson
  As user
  I want to not be able publish lesson
} do
  scenario 'publish lesson' do
    visit new_lesson_path
    expect(current_path).to eq new_user_session_path
  end
end