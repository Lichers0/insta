# typed: false
# frozen_string_literal: true

require "rails_helper"

RSpec.describe Web::RelationshipsController, type: :controller do
  let!(:user) { create(:user) }

  before { login(user) }

  describe "POST #create" do
    context "when user followed target-user" do
      let(:target_user) { create(:user) }

      subject(:create_request) { post :create, params: { user_id: target_user.id } }

      it "relationships count increases" do
        expect { create_request }.to change(Relationship, :count).by(1)
      end

      it "last followed user is target-user" do
        create_request
        expect(user.targets.last).to eq target_user
      end
    end
  end

  describe "DELETE #destroy" do
    context "when user unfollowed target-user" do
      let(:target_user) { create(:user) }

      subject(:destroy_request) { delete :destroy, params: { id: target_user.id } }

      before do
        user.targets << target_user
      end

      it "relationships count decreases" do
        expect { destroy_request }.to change(Relationship, :count).from(1).to(0)
      end
    end
  end
end
