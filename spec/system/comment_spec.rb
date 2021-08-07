require "rails_helper"

RSpec.describe "UserCommentPost", type: :system do
  it "user writes and sees comments" do
    user = create(:user)
    post = create(:post)

    login_as(user)
    visit post_path(post)

    fill_in :comment_body, with: "nice picture"
    click_on comment_button

    expect(page).to have_content("nice picture")
  end

  def comment_button
    "Add comment"
  end
end
