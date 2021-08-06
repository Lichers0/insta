require "rails_helper"

RSpec.describe "UserFeed", type: :system do
  it "user views feeds target-user" do
    user = create(:user)
    post_owner = create(:user)

    using_session("post_owner") do
      login_as(post_owner)

      visit new_post_path

      fill_in :post_title, with: "text"
      attach_file :post_image, Rails.root.join("spec/fixtures/1.png")

      click_on post_button
    end

    using_session("user") do
      login_as(user)

      visit users_path

      click_on user_feed

      expect(page).to have_css("img")
      expect(page.body).to include("1.png")
    end
  end

  def user_feed
    "feeds"
  end

  def post_button
    "Post"
  end
end
