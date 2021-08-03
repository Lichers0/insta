require "rails_helper"

RSpec.describe "Authenticate user", type: :system do
  it "creates new user" do
    visit root_path
    click_registration_button

    fill_in :user_email, with: "test@gmail.com"
    fill_in :user_password, with: "1234567890"
    fill_in :user_password_confirmation, with: "1234567890"

    click_sign_up_button

    expect(page).to have_content 'Welcome! You have signed up successfully'
  end

  def click_registration_button
    first(:link, "Sign up").click
  end

  def click_sign_up_button
    find('input[type="submit"]').click
  end
end
