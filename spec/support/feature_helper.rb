module FeatureHelper
  def sign_in_as user
    visit '/'

    click_on 'Sign In'

    fill_in 'Email', with: user.email

    fill_in 'Password', with: user.password

    click_on 'Send'
  end
end