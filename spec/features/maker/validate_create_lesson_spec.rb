require 'rails_helper'

feature 'Validate lesson', %q{
 In order to validate lesson
 As maker
 I want to validate lesson
} do

  given(:user){ create :user }

  before do
    sign_in_as user
    visit '/'
    click_on 'Publish new lesson'
  end

  scenario 'with empty title' do
    fill_in 'Description', with: 'describe'
    attach_file 'Video', "#{Rails.root}/spec/test_data/video.mp4"
    click_on 'Send'
    expect(page).to have_content(I18n.t('activerecord.errors.messages.blank', attribute: 'Title'))
  end

  scenario 'with empty description' do
    fill_in 'Title', with: 'title'
    attach_file 'Video', "#{Rails.root}/spec/test_data/video.mp4"
    click_on 'Send'
    expect(page).to have_content(I18n.t('activerecord.errors.messages.blank', attribute: 'Description'))
  end
  scenario 'with empty video' do
    fill_in 'Title', with: 'title'
    fill_in 'Description', with: 'describe'
    click_on 'Send'
    expect(page).to have_content(I18n.t('activerecord.errors.messages.blank', attribute: 'Video'))
  end
  scenario 'with failed format video' do
    fill_in 'Title', with: 'title'
    fill_in 'Description', with: 'describe'
    attach_file 'Video', "#{Rails.root}/spec/test_data/index.jpeg"
    click_on 'Send'
    expect(page).to have_content(I18n.t('errors.messages.extension_white_list_error'))
  end
end