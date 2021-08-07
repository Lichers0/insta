require "rails_helper"

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:posts).dependent(:destroy) }
  it do
    is_expected.to have_many(:relationships_as_follower)
      .class_name("Relationship").with_foreign_key("follower_id")
      .dependent(:destroy)
  end
  it { is_expected.to have_many(:targets).through(:relationships_as_follower) }
  it do
    is_expected.to have_many(:relationships_as_target)
      .class_name("Relationship").with_foreign_key("target_id")
      .dependent(:destroy)
  end
  it { is_expected.to have_many(:followers).through(:relationships_as_target) }
  it { is_expected.to have_many(:comments).dependent(:destroy) }
  it { is_expected.to have_many(:likes).dependent(:destroy) }
end
