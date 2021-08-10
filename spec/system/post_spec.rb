require "rails_helper"

RSpec.describe "Post", type: :system do
  it "creates new post", :js do
    user = create(:user)
    login_as(user)

    visit new_post_path

    # page.attach_file("#{Rails.root}/spec/fixtures/1.png") do
    #   image_field.click
    # end
    image_field.attach_file("#{Rails.root}/spec/fixtures/1.png")
    require 'pry'; binding.pry

    expect { click_on "Post" }.to change(Post, :count).by(1)
    expect(Post.last.image.filename).to eq "1.png"
  end

  def image_field
    find(:xpath, "//input[@field-name=\"spec-file-field\"]", visible: false)
  end
end
