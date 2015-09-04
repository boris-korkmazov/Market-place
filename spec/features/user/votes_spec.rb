require 'rails_helper'

feature 'user votes', %q{
  In order add votes
  As user
  I want to be able to vote
} do
  given!(:user){ create :user }
  given!(:lesson) { create :lesson, user: user, likes: 0 }

  scenario 'user dislikes', js: true do

    visit lesson_path lesson

    expect(page).to have_content('likes 0')

    click_on 'Dislike'

    expect(page).to have_content('likes -1')

  end

  scenario 'user likes', js: true do

    visit lesson_path lesson

    expect(page).to have_content('likes 0')

    click_on 'Like'

    expect(page).to have_content('likes 1')

  end
end