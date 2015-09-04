require 'rails_helper'

feature 'maker votes', %q{
  In order add votes
  As maker
  I want to not be able to vote
} do
  given!(:user){ create :user }
  given!(:guest_maker) {create :user}
  given!(:lesson) { create :lesson, user: user, likes: 0 }

  scenario 'Guest maker can  votes', js: true do
    sign_in_as guest_maker

    visit lesson_path lesson

    expect(page).to have_content('likes 0')

    click_on 'Dislike'

    expect(page).to have_content('likes -1')

    click_on 'Like'

    expect(page).to have_content('likes 0')

  end

  scenario 'maker can not votes for him lesson', js: true do

    sign_in_as user

    visit lesson_path lesson

    expect(page).to_not have_css('#like')

    expect(page).to_not have_css('#dislike')

    expect(page).to have_content('likes 0')

  end
end