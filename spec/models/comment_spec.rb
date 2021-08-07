require "rails_helper"

RSpec.describe Comment, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to belong_to :post }
  it { is_expected.to validate_presence_of(:body) }
  it "validates length body" do
    is_expected.to validate_length_of(:body)
      .is_at_least(5)
      .with_short_message("please enter at least 5 characters")
  end
end
