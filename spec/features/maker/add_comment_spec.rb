require 'rails_helper'

feature 'Add Comment', %q{
  In order create comment
  As maker
  I want to be able to create comment
} do
  given(:user){ create :user }

  given(:maker){ create :user }

  given(:lesson) {create :lesson, user: user}

  before do

  end

  scenario 'maker create comment' do

    sign_in_as maker

    visit lesson_path lesson

    expect(page).to_not have_content('Name')

    fill_in 'Comment', with: 'text'

    click_on 'Send'

    expect(page).to have_content('text')

    expect(page).to have_content(maker.email)

  end

end