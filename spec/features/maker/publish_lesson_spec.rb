require "rails_helper"

feature 'Publish a lesson', %q{
  In order to publish a lesson
  As maker
  I want to be able to publish a lesson
} do

  given(:user) {create(:user)}

  scenario 'publish a lesson' do

    sign_in_as user

    click_on 'Publish new lesson'

    expect(page).to have_title('Publish new lesson')

    fill_in 'Title', with: 'Lesson'

    fill_in 'Description', with: 'description'

    attach_file 'Video', "#{Rails.root}/spec/test_data/video.mp4"

    click_on 'Send'

    expect(page).to have_title('Lesson')

    expect(page).to have_content('Lesson')

    expect(page).to have_content('description')

    expect(page).to have_content("Author #{user.email}")

    expect(page).to have_content("Created at")

    expect(user.lessons[0].video).to_not be nil

  end
end