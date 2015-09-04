require 'rails_helper'

feature 'Add Comment', %q{
  In order create comment
  As user
  I want to be able to create comment
} do
  given(:user){ create :user }

  given(:lesson) {create :lesson, user: user}

  scenario 'user create comment' do
    visit lesson_path lesson

    fill_in 'Name', with: 'Serg'

    fill_in 'Comment', with: 'comment'

    click_on 'Send'

    expect(page).to have_content('comment')

    expect(page).to have_content('Serg')

  end

  context "with invalid data" do

    before {visit lesson_path lesson}

    scenario 'empty name' do

      fill_in 'Comment', with: 'comment'

      click_on 'Send'

      expect(page).to have_content(I18n.t('activerecord.errors.messages.blank', attribute: 'Name'))
    end

    scenario 'empty comment' do

      fill_in 'Name', with: 'name'

      click_on 'Send'

      expect(page).to have_content(I18n.t('activerecord.errors.messages.blank', attribute: 'Comment'))
    end
  end
end