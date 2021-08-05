require "rails_helper"

RSpec.describe "Post", type: :system do
  it "creates new post" do
    user = create(:user)
    login_as(user)

    visit new_post_path

    attach_file "Image", "#{Rails.root}/spec/fixtures/1.png"

    expect { click_on "Post" }.to change(Post, :count).by(1)
    expect(Post.last.image.filename).to eq "1.png"
  end
end
