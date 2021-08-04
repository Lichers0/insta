require "rails_helper"

RSpec.describe "Authenticate user", type: :system do
  it "creates new user" do
    visit root_path
    click_registration_link

    fill_in :user_email, with: "newuser@test.com"
    fill_in :user_password, with: "1234567890"
    fill_in :user_password_confirmation, with: "1234567890"

    expect { click_sign_up_button }.to change(User, :count).by(1)

    expect(page).to have_content good_creation_message
  end

  it "user signs in" do
    create(:user, email: "test@test2.com", password: "1qaz2wsx")

    visit root_path
    click_sign_in_link

    fill_in :user_email, with: "test@test2.com"
    fill_in :user_password, with: "1qaz2wsx"

    click_sign_in_button

    expect(page).to have_content good_login_message
  end

  def click_registration_link
    first(:link, "Sign up").click
  end

  def click_sign_in_link
    find(:link, "Log in").click
  end

  def click_sign_up_button
    find('input[type="submit"]').click
  end

  def click_sign_in_button
    find('input[type="submit"]').click
  end

  def good_creation_message
    "Welcome! You have signed up successfully"
  end

  def good_login_message
    "Signed in successfully."
  end
end
