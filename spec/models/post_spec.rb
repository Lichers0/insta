require "rails_helper"

RSpec.describe Post, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to have_many(:comments).dependent(:destroy) }
  it { is_expected.to validate_presence_of :image }
  it "haves one attaged image" do
    expect(Post.new.image).to be_an_instance_of(ActiveStorage::Attached::One)
  end
  it { is_expected.to have_many(:likes).dependent(:destroy) }
end
